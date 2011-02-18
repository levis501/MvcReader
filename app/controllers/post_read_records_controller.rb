class PostReadRecordsController < ApplicationController
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
end
