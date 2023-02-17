# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save!
    redirect_to posts_path, notice: 'Post salvo com sucesso'
  rescue StandardError
    render :new, status: :unprocessable_entity
  end

  def like
    @post = Post.find(params[:id])
    @post.likes.create(user_id: current_user.id)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
