class Api::BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
    render 'api/bookmarks'
  end

  def show
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id

    if @bookmark.save
      render 'api/bookmarks'
    else
      render json: @bookmark.errors.full_messages, status: 422
    end
  end

  def destroy
    @bookmark.find(params[:id])
    @bookmark.destroy
    render "api/tickets/show"
  end

  def bookmark_params
    params.require(:bookmark).permit(:event_id)
  end

end