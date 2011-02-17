class PostReadRecord < ActiveRecord::Base
  belongs_to :users
  belongs_to :rss_posts
end
