class SubscriptionsController < ApplicationController
  def create
#    logger.debug "Creating subscription for user #{@user.id}"
    @user = User.find(params[:subscription][:user_id])
    @subscription = @user.subscriptions.create(params[:subscription])
    @subscription.feed_url=params[:subscription][:feed_url]    
    redirect_to user_path(@user)
  end
  
  def destroy
    @subscription = Subscription.find(params[:id])
    @user = User.find(@subscription.user_id)
    rss_feed_id = @subscription.rss_feed_id
    @subscription.destroy
    @subscription.save
    RssFeed.find(rss_feed_id).cleanup_unused
    redirect_to user_path(@user)
  end
  
  def show
    @subscription = Subscription.find(params[:id])
    @user = User.find(@subscription.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

# PUT /subscriptions/1
# PUT /subscriptions/1.xml
  def update
    @subscription = Subscription.find(params[:id])
    @user = User.find(@subscription.user_id)
    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        format.html { redirect_to(@user, :notice => 'Subscription was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /users/1/subscriptions/new
  # GET /users/1/subscriptions/new.xml
  def new
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end
end
