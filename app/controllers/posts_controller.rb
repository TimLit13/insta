class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_post, only: [:show, :destroy]
  
  def index
    @posts = Post.all.limit(100).includes(:photos, :user, :likes, :bookmarks).order('created_at desc')
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if params[:images]
        params[:images].each_key do |img|
          @post.photos.create(image: params[:images][img])
        end
      end
      redirect_to root_path, success: "Saved.."
    else
      redirect_to root_path, danger: "Something went wrong.."
    end
  end

  def show
    @photos = @post.photos
    @likes = @post.likes.includes(:user)
    @bookmarks = @post.bookmarks.includes(:user)
    @comment = Comment.new
    @is_liked = @post.is_liked(current_user)
    @is_bookmarked = @post.is_bookmarked(current_user)
  end


  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:notice] = "Post deleted!"
      else
        flash[:alert] = "Something went wrong.."
      end
    else
      flash[:notice] = "You don't have permission to do that!"
    end
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find_by id: params[:id]

    return if @post
    flash[:danger] = "Post not exists!"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(
      :content,
      :images
    )
  end

end