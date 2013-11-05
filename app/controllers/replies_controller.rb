class RepliesController < ApplicationController
 before_filter :authenticate_user!, :except => [:create]
  def index
    @replies = Reply.all
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(params[:reply])
    if @reply.save
        if @reply.author_type == "Customer"
          @reply.ticket.update_attributes(:status_id=>1)
        else
          @reply.ticket.update_attributes(:status_id=>2)
        end
      #redirect_to @reply, :notice => "Successfully created reply."
      redirect_to ticket_path(@reply.ticket)
    else
      render :action => 'new'
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    if @reply.update_attributes(params[:reply])
      redirect_to @reply, :notice  => "Successfully updated reply."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to replies_url, :notice => "Successfully destroyed reply."
  end
end
