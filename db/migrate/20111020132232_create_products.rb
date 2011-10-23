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
      t.float :cost, :default => 0.0
      t.float :price, :default => 0.0
      t.float :special_price, :default => 0.0
      t.float :member_price, :default => 0.0
      t.string :status, :default => "Active"
      t.integer :quantity, :default => 0
      t.integer :category_id, :null => false, :options =>
        "CONSTRAINT fk_category REFERENCES categories(id)"
      t.timestamps
    end

    # insert some samples
    Product.create(:name => "Laptop", :category_id => 1, :description => %{Portable PC},
                                      :image_url => '../images/products/1.jpg', :price => 5)
    Product.create(:name => "Desktop", :category_id => 1, :description => %{Traditional PC},
                                      :image_url => '../images/products/2.gif', :price => 6)
    Product.create(:name => "Netbook", :category_id => 1, :description => %{Utra-Portable PC},
                                      :image_url => '../images/products/3.jpg', :price => 7)
    Product.create(:name => "Tablet", :category_id => 1, :description => %{Portable PC with touch screen},
                                      :image_url => '../images/products/4.gif', :price => 8)
    Product.create(:name => "All-in-one PC", :category_id => 1, :description => %{One block PC},
                                      :image_url => '../images/products/5.gif', :price => 9)
    
    # add some indexes
    add_index :products, [:name, :status]
    
  end

  def self.down
    drop_table :products
  end
end
