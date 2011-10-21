######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class Product < ActiveRecord::Base
  # preprocessor
  
  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 20
  validates_numericality_of :price

  # relations
  has_many :line_items

  # namescopes
  
  # methods
   
  ######################################################
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################
  def validate_format_of_image_url
    validates_format_of :image_url, 
                      :with => %r{\.(gif|jpg|png)$}i,
                      :message => 'must be a URL for GIF, JPG ' + 'or PNG image.'
  end
  
  ######################################################
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################
  def self.find_products_for_sale
    find(:all)
  end

   
    
end
