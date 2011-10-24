class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :parent_id, :default => nil
      t.string :status, :default => "Active"

      t.timestamps
    end
    
    # add some indexes
    add_index :categories, [:name, :status]

    # insert some samples data
    c1 = Category.create(:name => "Laptop")
    c2 = Category.create(:name => "Desktop")
    c3 = Category.create(:name => "Memory")
    c4 = Category.create(:name => "Monitor")
    c5 = Category.create(:name => "Flash Drive")
    c6 = Category.create(:name => "CPU")
    c7 = Category.create(:name => "Keyboard & Mouse")
    c8 = Category.create(:name => "Peripherals")
    c9 = Category.create(:name => "Card")
    
    c1.children.create(:name => "Tablet")
    c1.children.create(:name => "Acer")
    c1.children.create(:name => "Apple")
    c1.children.create(:name => "Asus")
    c1.children.create(:name => "IBM - Lenovo")
    c1.children.create(:name => "HP - Compaq")
    c1.children.create(:name => "Dell")
    c1.children.create(:name => "Toshiba")
    c1.children.create(:name => "Samsung")
    c1.children.create(:name => "Others")
    
    c2.children.create(:name => "Intel")
    c2.children.create(:name => "Toky")
    c2.children.create(:name => "IBM - Lenovo")
    c2.children.create(:name => "Others")
    
    c3.children.create(:name => "DDR SDRAM")
    c3.children.create(:name => "DDR SDRAM2")
    c3.children.create(:name => "DDR SDRAM3")
    c3.children.create(:name => "Others")
    
    c4.children.create(:name => "Acer")
    c4.children.create(:name => "Asus")
    c4.children.create(:name => "LG")
    c4.children.create(:name => "Samsung")
    c4.children.create(:name => "Dell")
    c4.children.create(:name => "HP")
    c4.children.create(:name => "Others")
    
    c5.children.create(:name => "Kingmax")
    c5.children.create(:name => "Kingston")
    c5.children.create(:name => "Apacer")
    c5.children.create(:name => "Transcend")
    c5.children.create(:name => "JVJ")
    c5.children.create(:name => "Others")
    
    c6.children.create(:name => "Intel")
    c6.children.create(:name => "AMD")
    c6.children.create(:name => "Others")
    
    c7.children.create(:name => "Keyboard")
    c7.children.create(:name => "Mouse")
    c7.children.create(:name => "Others")
    
    c8.children.create(:name => "Speaker")
    c8.children.create(:name => "Headphone")
    c8.children.create(:name => "ODD")
    c8.children.create(:name => "HDD")
    c8.children.create(:name => "Webcam")
    c8.children.create(:name => "Case")
    c8.children.create(:name => "Power Supply")
    c8.children.create(:name => "Router")
    c8.children.create(:name => "Others")
    
    c9.children.create(:name => "VGA Card")
    c9.children.create(:name => "Sound Card")
    c9.children.create(:name => "Tivi Card")
    c9.children.create(:name => "Network Card")
    c9.children.create(:name => "Others")

  end
  

  def self.down
    drop_table :categories
  end
end
