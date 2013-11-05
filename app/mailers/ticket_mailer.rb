class TicketMailer < ActionMailer::Base
  default :from => "shpytalenko@gmail.com"
  
  def ticket_update_information(ticket)
    @ticket = ticket
    mail(:to => ticket.email , :subject => "Ticket created")
  end
end
