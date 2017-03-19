class Api::EventsController < ApplicationController
  def index
    if params[:category]
      @events = Event.find_by_sql(<<-SQL)
        SELECT *
        FROM events
        JOIN category_listings
          ON category_listings.event_id = events.id
        JOIN categories
          ON categories.id = category_listings.category_id
        WHERE categories.category = '#{params[:category]}'
        LIMIT #{params[:limit]}
      SQL
    else
      @events = Event.limit(params[:limit]) || Event.all
    end

    render 'api/events/index'
  end


  def show
    @event = Event.find(params[:id])
    render "api/events/show"
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      #CategoryListing.create(category_id: ??, event_id: @event.id)
      render "api/events/show"
    else
      render json: @event.errors.full_messages, status: 422
    end
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      render "api/events/show"
    else
      render json: @event.errors.full_messages, status: 422
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render "api/events/show"
  end

  def event_params
    params.require(:event).permit(:title, :description, :price, :date, :location, :image_url)
  end
end
