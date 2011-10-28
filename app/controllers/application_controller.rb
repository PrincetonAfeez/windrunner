# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class ApplicationController < ActionController::Base
  # active scafoold
  ActiveScaffold.set_defaults do |conf|
    #conf.list.results_per_page = 20
    conf.actions.add :list_filter
  end
  
  
  # preprocessor[]
  before_filter :authorize, :except => :login
  before_filter :set_locale
  before_filter :set_exchange
  
  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '760223299f1b8939d906c357458c0144ba24c87c6606f841a17991e26777f1c9229d4e7e9d706dd84295258a8e4f1dfd21422a8045a2b26572a3692445b3fb6f'
  ## See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
  
  ######################################################
  # -- Output: redirect to login page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def authorize
    unless User.find_by_id(session[:user_id]) or User.count == 0
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in." 
      redirect_to(:controller=>"admin", :action=>"login")
    end
    if User.count == 0 
      if request.path_parameters[:action]=="add_user" and request.path_parameters[:controller]=="login" 
        #As we are already on our way to the add_user action, do nothing here.
      else
        flash[:notice] = "Please create an account." 
        redirect_to(:controller=>"login", :action=>"add_user")
      end
    end
  end
  
  ######################################################
  # -- Output: set the locale based on user's choice
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
    locale_path = "#{LOCALES_DIRECTORY}#{I18n.locale}.yml"
    unless I18n.load_path.include? locale_path
      I18n.load_path << locale_path
      I18n.backend.send(:init_translations)
    end
  rescue Exception => err
    logger.error err
    flash.now[:notice] = "#{I18n.locale} translation not available"
    I18n.load_path -= [locale_path]
    I18n.locale = session[:locale] = I18n.default_locale
  end

  ######################################################
  # -- Output: set the exchange_rate
  # LongPH - Oct 25th, 2011
  #    create
  ######################################################
  def set_exchange
    if session[:locale] == "vi"
      vnd = 1
      usd = 1
    else
      vnd = 20800
      usd  = 1
    end
    $exchange_rate = vnd/usd
  end
  
end