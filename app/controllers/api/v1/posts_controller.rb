module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all
        render json: PostSerializer.new(posts, include: [:user]).serializable_hash
      end

      def show
        post = Post.find(params[:id])
        render json: PostSerializer.new(post, include: [:user]).serializable_hash
      end
    end
  end
end
