######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class AdminController < ApplicationController
  
  ######################################################
  # -- Output: authorize user
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def login
    if request.post?
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        session[:membership] = user.membership
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index" })
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  ######################################################
  # -- Output: redirect to login page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def logout
    session[:user_id] = nil
    session[:membership] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login" )
  end

  ######################################################
  # -- Output: return the total of Order
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def index
    @total_orders = Order.count
  end


end
