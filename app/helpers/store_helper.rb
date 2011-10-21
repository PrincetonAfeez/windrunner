######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
module StoreHelper
  
  ######################################################
  # -- Output: hide cart in sidebar
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style" ] = "display: none"
    end
    content_tag("div" , attributes, &block)
  end
end
