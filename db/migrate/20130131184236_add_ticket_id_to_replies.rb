class AddTicketIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :ticket_id, :integer
  end
end
