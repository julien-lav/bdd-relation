class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")

  end

  # pas de suite
  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])

end

  def update
    @post = Post.find(params[:id])
    if @post.update(params_post)
    redirect_to post_path
  else
    render 'edit'
  end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path

  end


  private

  def params_post
    params.require(:post).permit(:title, :body)
  end
end
