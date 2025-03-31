module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all

        if params[:published].present?
          case params[:published]
          when "true"
            posts = posts.where(published: true)
          when "false"
            posts = posts.where(published: false)
          else
            return render json: {
              errors: [{ detail: "Invalid published value. Use 'true' or 'false'" }]
            }, status: :bad_request
          end
        end

        render json: PostSerializer.new(posts, include: [:user]).serializable_hash
      end

      def show
        post = Post.find(params[:id])
        render json: PostSerializer.new(post, include: [:user]).serializable_hash
      end

      private

      # You can keep post_params for create/update actions only
      def post_params
        params.require(:post).permit(:title, :content, :published, :user_id)
      end
    end
  end
end
