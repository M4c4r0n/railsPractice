class BookmarksController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @bookmark = Bookmark.find(params[:id])
  end
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to bookmark_path(@bookmark)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end
  private
  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :body)
  end
end
