class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :rss_feed
  attr_accessible :rss_feed
  attr_accessible :feed_url
  
  def feed_url
    if self.rss_feed_id.nil? then ""
    else RssFeed.find(self.rss_feed_id).url
    end
  end
  
  def feed_url=(url)
    rss_feed = RssFeed.where(:url => url)[0]
    if rss_feed.nil? then
      rss_feed = RssFeed.create(:url => url)
    end
    old_feed_id = self.rss_feed_id
    self.rss_feed_id = rss_feed.id
    save
    if not old_feed_id.nil? then
      RssFeed.find(old_feed_id).cleanup_unused
    end
  end
end
