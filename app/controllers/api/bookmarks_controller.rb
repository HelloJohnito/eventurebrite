class Api::BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
    render 'api/bookmarks/index'
  end

  def show
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id

    if @bookmark.save
      render 'api/bookmarks/show'
    else
      render json: @bookmark.errors.full_messages, status: 422
    end
  end

  def destroy
    event_id = params[:id].to_i
    current_user_id = current_user.id
    bookmark = Bookmark.where(["event_id = ? and user_id = ?", "#{event_id}", "#{current_user_id}"])
    @bookmark = bookmark.first
    @bookmark.destroy
    render "api/bookmarks/show"
  end

  def bookmark_params
    params.require(:bookmark).permit(:event_id)
  end

end
