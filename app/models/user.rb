class User < ActiveRecord::Base
  attr_accessible :email
  validates :email, :presence => true
  has_many :subscriptions
  has_many :post_read_records
  
  # although emails are unique, 
  # automatic validation is skipped to unify signin & signup process
  # TODO: make separate sign-in and sign-up processes
  
  #validates_uniqueness_of :email   
end
