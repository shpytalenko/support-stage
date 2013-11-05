class TicketsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :show, :update, :create]
  def index
      @search = Ticket.search(params[:search])
      @tickets = @search.all
   end

  def show
    @ticket = Ticket.find(params[:id])
    @reply = @ticket.replies.new
    if current_user.present?
      @reply.author=current_user 
    else
      @reply.author = Customer.find_by_email(@ticket.email) 
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    
    if @ticket.save
      # send mail with delayed_job
      TicketMailer.delay.ticket_update_information(@ticket)  
      redirect_to @ticket, :notice => "Successfully created ticket."
    else
      render :action => 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to @ticket, :notice  => "Successfully updated ticket."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_url, :notice => "Successfully destroyed ticket."
  end
end
