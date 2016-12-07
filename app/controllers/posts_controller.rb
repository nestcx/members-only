class PostsController < ApplicationController
	before_action :logged_in, only:[:new, :destroy, :create]

  def new
  	@post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
  end

  def create
    #user_id fk column gets the return of the sessions_helper method: current_userra
  	@post = Post.create(title: params[:post][:title], body: params[:post][:body], user_id: current_userra.id)
  	flash[:success] = "Posted!"
  	redirect_to posts_path
  end

  def destroy
    Post.find_by(id: params[:id]).delete
    redirect_to root_path
  end

  private

  def logged_in
  	unless signed_in?
  		flash[:danger] = "You must be logged in!"
  		redirect_to root_path
  	end
  end

end
