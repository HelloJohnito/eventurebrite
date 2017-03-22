class Api::TicketsController < ApplicationController

  def index
    @tickets = current_user.tickets
    render 'api/tickets'
  end

  def create
    @ticket = Ticket.new
    @ticket.even_id = params[:ticket][:eventId]
    @ticket.user_id = current_user.id
    #Check here
    if @ticket.save
      render "api/tickets/show"
    else
      render json: @event.errors.full_messages, status: 422
    end
  end

  def destroy
    @ticket.find(params[:id])
    @ticket.destroy
    render "api/tickets/show"
  end

  # def ticket_params
  #   params.require(:ticket).permit(:event_id)
  # end
end
