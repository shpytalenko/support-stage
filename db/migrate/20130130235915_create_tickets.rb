class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :subject
      t.string :message
      t.string :no
      t.string :url
      t.integer :owner_id
      t.integer :status_is
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
