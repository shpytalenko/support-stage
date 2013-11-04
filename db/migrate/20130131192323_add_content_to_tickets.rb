class AddContentToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :content, :string
  end
end
