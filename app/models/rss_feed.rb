class RssFeed < ActiveRecord::Base
  has_many :rss_posts
  has_many :subscriptions
end
