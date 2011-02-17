class PostReadRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :rss_post
end
