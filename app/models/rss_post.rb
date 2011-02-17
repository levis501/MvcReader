class RssPost < ActiveRecord::Base
  belongs_to :rss_feed
  has_many :post_read_records
end
