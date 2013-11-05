class RemoveUrlFromTickets < ActiveRecord::Migration
  def up
    remove_column :tickets, :url
  end

  def down
    add_column :tickets, :url, :string
  end
end
