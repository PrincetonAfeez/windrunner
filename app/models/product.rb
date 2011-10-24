# == Schema Information
# Schema version: 20111024084821
#
# Table name: products
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  unique        :string(255)
#  description   :text
#  image_url     :string(255)     default("No image")
#  cost          :float           default(0.0)
#  price         :float           default(0.0)
#  special_price :float           default(0.0)
#  member_price  :float           default(0.0)
#  status        :string(255)     default("Active")
#  quantity      :integer(4)      default(0)
#  category_id   :integer(4)      not null
#  created_at    :datetime
#  updated_at    :datetime
#

######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class Product < ActiveRecord::Base
  # preprocessor
  
  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 100
  validates_numericality_of :price

  # relations
  has_many :orders, :through => :line_items
  has_many :line_items

  # namescopes
  
  # methods
   
  ######################################################
  # -- Output: error if validation fail
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################
  def validate_format_of_image_url
    validates_format_of :image_url, 
                      :with => %r{\.(gif|jpg|png)$}i,
                      :message => 'must be a URL for GIF, JPG ' + 'or PNG image.'
  end
  
  ######################################################
  # -- Output: products to be sold-off
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################
  def self.find_products_for_sale_off
    find(:all, :conditions => ["special_price > 0"])
  end

   
    
end
