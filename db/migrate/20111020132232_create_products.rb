######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, :unique
      t.text :description
      t.string :image_url, :default => "No image"
      t.float :price, :default => 0.0
      t.float :special_price, :default => 0.0
      t.float :member_price, :default => 0.0
      t.string :status, :default => "active"
      t.integer :quantity, :default => 0
      t.integer :category_id

      t.timestamps
    end

    # insert some samples
    Product.create(:name => "Laptop", :category_id => 1, :description => %{<p>Portable PC</p>},
                                      :image_url => '../images/products/1.jpg')
    Product.create(:name => "Desktop", :category_id => 1, :description => %{<p>Traditional PC</p>},
                                      :image_url => '../images/products/2.gif')
    Product.create(:name => "Netbook", :category_id => 1, :description => %{<p>Utra-Portable PC</p>},
                                      :image_url => '../images/products/3.jpg')
    Product.create(:name => "Tablet", :category_id => 1, :description => %{<p>Portable PC with touch screen</p>},
                                      :image_url => '../images/products/4.gif')
    Product.create(:name => "All-in-one PC", :category_id => 1, :description => %{<p>One block PC</p>},
                                      :image_url => '../images/products/5.gif')
      
  end

  def self.down
    drop_table :products
  end
end
