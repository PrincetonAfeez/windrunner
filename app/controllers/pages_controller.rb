######################################################
# LongPH - Oct 22nd, 2011
#    create file
######################################################
class PagesController < ApplicationController
  # preprocesors
  
  # methods
  
  ######################################################
  # -- Output: redirect to home page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def home
  end

  ######################################################
  # -- Output: redirect to contact page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def contact
  end

  ######################################################
  # -- Output: redirect to faq page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def faq
  end

  ######################################################
  # -- Output: redirect to settings page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def settings
  end
  
  ######################################################
  # -- Output: redirect to help page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def help
    
  end

	######################################################
  # -- Output: redirect to love page
  # LongPH - Dec 3rd, 2011
  #    create
  ######################################################
  def love
    
  end

	######################################################
  # -- Output: redirect to love page
  # LongPH - Dec 3rd, 2011
  #    create
  ######################################################
  def love_email
    @name_array = []
    @name_array << params[:page][:name]
    if params[:name1].nil?
    	@name_array << params[:page][:name1]
    end
    if params[:name2].nil?
    	@name_array << params[:page][:name2]
    end
    if params[:name3].nil?
    	@name_array << params[:page][:name3]
    end
    email = OrderMailer.create_love_sent(@name_array)
    email.set_content_type("text/html" )
    OrderMailer.deliver(email)
    msg = "Chúng tôi sẽ thông báo cho bạn kết quả trong thời gian sớm nhất. Xin chào và xin cảm ơn."
    redirect_to_index (msg)
  end
end
