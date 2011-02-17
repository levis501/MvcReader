class User < ActiveRecord::Base
  attr_accessible :email
  validates :email, :presence => true
  has_many :subscriptions
  has_many :post_read_records
end
