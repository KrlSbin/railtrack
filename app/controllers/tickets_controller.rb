class TicketsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @tickets = @project.tickets
  end

  def new
    @ticket = Ticket.new(new_ticket_params)
  end

  def create
    @ticket = Ticket.create(create_ticket_params)
    redirect_to project_tickets_path(@ticket.project)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(update_ticket_params)
      redirect_to project_ticket_path(@ticket.project, @ticket)
    else
      render "edit"
    end
  end

  private

  def new_ticket_params
    params.permit(:project_id)
  end

  def create_ticket_params
    params.require(:ticket).permit(:name, :description, :priority, :done, :project_id)
  end

  def update_ticket_params
    params.require(:ticket).permit(:name, :description, :priority, :done)
  end
end
