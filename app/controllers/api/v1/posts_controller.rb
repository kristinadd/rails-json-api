module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all
      
        # ✅ Filtering by published param
        if params[:published].present?
          case params[:published]
          when "true"
            posts = posts.where(published: true)
          when "false"
            posts = posts.where(published: false)
          end
        end
      
        render json: PostSerializer.new(posts, include: [:user]).serializable_hash
      end
      

      def show
        post = Post.find(params[:id])
        render json: PostSerializer.new(post, include: [:user]).serializable_hash
      end
    end
  end
end
