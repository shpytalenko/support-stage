class Ticket < ActiveRecord::Base
  
  attr_accessible :name, :email, :status_attributes, :status, :department, :replies, :subject, :message, :no, :status_id, :content, :user_id
  validates :no, :uniqueness => true
  validates_presence_of :name, :email, :department, :subject, :content
  extend FriendlyId
  friendly_id :no
  has_associated_audits
  audited
  has_many :replies, :dependent => :destroy
  belongs_to :status
  belongs_to :user
  before_create :generate_no, :save_customer
  #after_create :send_emeal
  # Number format ABC-123456
 
   
private
 def generate_no
  no = "#{ (0...3).map { (65 + rand(26)).chr }.join}-#{ (0...6).map { rand(10) }.join}"
  self.no = no 
 end

 def save_customer
  if Customer.find_by_email(email) == nil
    Customer.create(:name=> name, :email => email )
  end 
 end

  
end
