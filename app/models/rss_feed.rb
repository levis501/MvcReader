class RSSFeed < ActiveRecord::Base
  has_many :rss_posts
  has_many :subscriptions
  validates_uniqueness_of :url
end
