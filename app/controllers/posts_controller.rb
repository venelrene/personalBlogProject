class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post  }
        format.json { render :show, status: :created, location: @post  }
      else
        format.html { render :new }
        format.json { render json: @post .errors, status: :unprocessable_entity}
      end
    end
  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
