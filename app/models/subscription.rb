class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :rss_feed
  attr_accessible :rss_feed
  
  def feed_url
    if @rss_feed_id.nil? then ""
    else RssFeed.find(@rss_feed_id).url
    end
  end
  
  def feed_url=(url)
    rss_feed_id = RssFeed.where(:url => url)[0]
    if rss_feed_id.nil? then 
      puts "Creating feed for #{url}"
      rss_feed = RssFeed.create(url);
      @rss_feed_id = rss_feed.id
    else 
      @rss_feed_id = rss_feed_id
    end
  end
end
