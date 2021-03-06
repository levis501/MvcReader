class RssFeedsController < ApplicationController
  # GET /rss_feeds/1/edit
  def edit
    @rss_feed = RssFeed.find(params[:id])
  end

  # POST /rss_feeds
  # POST /rss_feeds.xml
  def create
    @rss_feed = RssFeed.new(params[:rss_feed])

    respond_to do |format|
      if @rss_feed.save
        format.html { redirect_to(@rss_feed, :notice => 'Rss feed was successfully created.') }
        format.xml  { render :xml => @rss_feed, :status => :created, :location => @rss_feed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rss_feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rss_feeds/1
  # PUT /rss_feeds/1.xml
  def update
    @rss_feed = RssFeed.find(params[:id])

    respond_to do |format|
      if @rss_feed.update_attributes(params[:rss_feed])
        format.html { redirect_to(@rss_feed, :notice => 'Rss feed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rss_feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_feeds/1
  # DELETE /rss_feeds/1.xml
  def destroy
    @rss_feed = RssFeed.find(params[:id])
    @rss_feed.destroy

    respond_to do |format|
      format.html { redirect_to(rss_feeds_url) }
      format.xml  { head :ok }
    end
  end
end
