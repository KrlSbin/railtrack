class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new(new_ticket_params)
  end

  def create
    @ticket = Ticket.create(create_ticket_params)
    redirect_to project_tickets_path(@ticket.project)
  end

  private

  def new_ticket_params
    params.permit(:project_id)
  end

  def create_ticket_params
    params.require(:ticket).permit(:name, :description, :project_id)
  end
end
