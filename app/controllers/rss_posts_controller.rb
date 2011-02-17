class RssPostsController < ApplicationController
  # GET /rss_posts
  # GET /rss_posts.xml
  def index
    @rss_posts = RssPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rss_posts }
    end
  end

  # GET /rss_posts/1
  # GET /rss_posts/1.xml
  def show
    @rss_post = RssPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rss_post }
    end
  end

  # GET /rss_posts/new
  # GET /rss_posts/new.xml
  def new
    @rss_post = RssPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rss_post }
    end
  end

  # GET /rss_posts/1/edit
  def edit
    @rss_post = RssPost.find(params[:id])
  end

  # POST /rss_posts
  # POST /rss_posts.xml
  def create
    @rss_post = RssPost.new(params[:rss_post])

    respond_to do |format|
      if @rss_post.save
        format.html { redirect_to(@rss_post, :notice => 'Rss post was successfully created.') }
        format.xml  { render :xml => @rss_post, :status => :created, :location => @rss_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rss_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rss_posts/1
  # PUT /rss_posts/1.xml
  def update
    @rss_post = RssPost.find(params[:id])

    respond_to do |format|
      if @rss_post.update_attributes(params[:rss_post])
        format.html { redirect_to(@rss_post, :notice => 'Rss post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rss_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_posts/1
  # DELETE /rss_posts/1.xml
  def destroy
    @rss_post = RssPost.find(params[:id])
    @rss_post.destroy

    respond_to do |format|
      format.html { redirect_to(rss_posts_url) }
      format.xml  { head :ok }
    end
  end
end
