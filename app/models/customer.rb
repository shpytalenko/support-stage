class Customer < ActiveRecord::Base
  attr_accessible :name, :email
  validates_presence_of :name, :email
  validates :email, :uniqueness => true
  has_many :replies, as: :author
  
end
