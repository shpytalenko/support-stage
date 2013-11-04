class Reply < ActiveRecord::Base
  attr_accessible :content, :author, :ticket_id
  validates_presence_of :content, :author, :ticket_id
  belongs_to :ticket
  # tracking updates
  audited :associated_with => :ticket
end
