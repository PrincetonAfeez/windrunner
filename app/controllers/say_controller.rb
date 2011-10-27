######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class SayController < ApplicationController
  
  ######################################################
  # LongPH - Oct 20th, 2011
  #   created
  # LongPH - Oct 27th, 2011
  #   use create for email creation
  #   use deliver for email delivery
  ######################################################
  def hello
    order = Order.find_by_name("longph")
    email = OrderMailer.create_confirm(order)
    render(:text => "<pre>" + email.encoded + "</pre>" )

  end
  
  ######################################################
  # LongPH - Oct 20th, 2011
  #   created
  # LongPH - Oct 27th, 2011
  #   use create then deliver for email delivery
  ######################################################
  def goodbye
    order = Order.find_by_name("longph" )
    email = OrderMailer.create_sent(order)
    email.set_content_type("text/html" )
    OrderMailer.deliver(email)
    render(:text => "<pre>" + email.encoded + "</pre>" )
  end
  
  ######################################################
  # LongPH - Oct 20th, 2011
  #   created
  ######################################################
  def list_files
    @files = Dir.glob('*')
  end
  
  
end
