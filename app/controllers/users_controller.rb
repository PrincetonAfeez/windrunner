######################################################
# LongPH - Oct 22nd, 2011
#    create file
######################################################
class UsersController < ApplicationController
  # preprocessor
  skip_before_filter :authorize, :only => :new
  
  # GET /users
  # GET /users.xml
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def index
    @users = User.find(:all, :order => :username)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user }
    end
  end
  
  # GET /users/1/edit
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def edit
    @user = User.find(params[:id])
  end
  
  # POST /users
  # POST /users.xml
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.username} was successfully created."
        format.html { redirect_to(:action=>'index' ) }
        format.xml { render :xml => @user, :status => :created,
          :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors,
          :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.username} was successfully updated."
        format.html { redirect_to(:action=>'index' ) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user.errors,
          :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def destroy
    @user = User.find(params[:id])
    begin
      flash[:notice] = "User #{@user.name} deleted"
      @user.destroy
    rescue Exception => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml { head :ok }
    end
  end
end
