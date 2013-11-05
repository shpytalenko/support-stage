class Reply < ActiveRecord::Base
  attr_accessible :content, :author, :ticket_id , :author_id, :author_type
  validates_presence_of :content, :author, :ticket_id
  belongs_to :ticket
  belongs_to :author, polymorphic: true
  # tracking updates
  audited :associated_with => :ticket
end
