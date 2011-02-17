class SubscriptionsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.create(params[:subscription])
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.find(params[:id])
    @subscription.destroy
    redirect_to user_path(@user)
  end
  
  # GET /subscriptions
  # GET /subscriptions.xml
  def index
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.xml
  def show
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subscription }
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

  # GET /subscriptions/new
  # GET /subscriptions/new.xml
  def new0
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.xml
  def update
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        format.html { redirect_to(@subscription, :notice => 'Subscription was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

end
