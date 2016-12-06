class PostsController < ApplicationController
	before_action :logged_in, only:[:new]

  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def create
  	@post = Post.create(title: params[:post][:title], body: params[:post][:body], user_id: current_user.id)
  	flash[:success] = "Posted!"
  	redirect_to posts_path
  end

  private

  def logged_in
  	unless signed_in?
  		flash[:danger] = "You must be logged in!"
  		redirect_to root_path
  	end
  end

end
