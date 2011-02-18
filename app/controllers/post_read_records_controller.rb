class PostReadRecordsController < ApplicationController
  # GET /post_read_records
  # GET /post_read_records.xml
  def index
    @post_read_records = PostReadRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_read_records }
    end
  end

  # GET /post_read_records/1
  # GET /post_read_records/1.xml
  def show
    @post_read_record = PostReadRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_read_record }
    end
  end

  # GET /post_read_records/new
  # GET /post_read_records/new.xml
  def new
    @post_read_record = PostReadRecord.new(:rss_post_id => params[:post_id], :user_id => params[:user_id])
    @post_read_record.save
    redirect_to rss_post_path(@post_read_record.rss_post_id)
#    redirect_to RssPost.find(@post_read_record.rss_post_id).link
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @post_read_record }
#    end
  end

  # GET /post_read_records/1/edit
  def edit
    @post_read_record = PostReadRecord.find(params[:id])
  end

  # POST /post_read_records
  # POST /post_read_records.xml
  def create
    @post_read_record = PostReadRecord.new(params[:post_read_record])

    respond_to do |format|
      if @post_read_record.save
        format.html { redirect_to(@post_read_record, :notice => 'Post read record was successfully created.') }
        format.xml  { render :xml => @post_read_record, :status => :created, :location => @post_read_record }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_read_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_read_records/1
  # PUT /post_read_records/1.xml
  def update
    @post_read_record = PostReadRecord.find(params[:id])

    respond_to do |format|
      if @post_read_record.update_attributes(params[:post_read_record])
        format.html { redirect_to(@post_read_record, :notice => 'Post read record was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_read_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_read_records/1
  # DELETE /post_read_records/1.xml
  def destroy
    @post_read_record = PostReadRecord.find(params[:id])
    @post_read_record.destroy

    respond_to do |format|
      format.html { redirect_to(post_read_records_url) }
      format.xml  { head :ok }
    end
  end
end
