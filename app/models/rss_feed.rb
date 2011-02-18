require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class RssFeed < ActiveRecord::Base
  has_many :rss_posts, :dependent => :destroy
  has_many :subscriptions
  #validates_uniqueness_of :url
  
  def get_latest_feed
    logger.debug "updating RssFeed id #{self.id}"
    content = ""
    begin
      open(self.url) do |s| content = s.read end
      rss = RSS::Parser.parse(content, false)
      self.title = rss.channel.title
      self.description = rss.channel.description
      rss.items.each do |item| 
        if RssPost.where(:link => item.link).length == 0 then 
          RssPost.create(:rss_feed_id => self.id, 
                       :title => item.title,
                       :link => item.link,
                       :description => item.description)
        end
      end
    rescue
      self.title = "ERROR connecting to this feed"
      self.description = "Check the URL of the feed and make any necessary corrections"
      logger.debug "ERROR getting feed from url #{self.url}"
    end
    save
  end
  
  def cleanup_unused
    subscriptions = Subscription.where( :rss_feed_id => self.id)
    if subscriptions.length == 0 then
      destroy
    end
  end
end
