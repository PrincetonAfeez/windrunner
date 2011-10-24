class AddSamplesData < ActiveRecord::Migration
  def self.up
  
  # 1 Laptop: 10 Tablet
  Product.create(:name => "Samsung Galaxy Tab", :description => %{<p>10.1 Wifi 3G<p>}, :category_id => 10, :image_url => '../images/heroes/001.gif', :price => 13290000)
  Product.create(:name => "Acer Iconia Tab", :description => %{<p>A500 16GB Black<p>}, :category_id => 10, :image_url => '../images/heroes/002.gif', :price => 8800000)
  Product.create(:name => "Asus Eee Pad Transformer", :description => %{<p>TF 101<p>}, :category_id => 10, :image_url => '../images/heroes/003.gif', :price => 9900000)
  Product.create(:name => "Apple iPad2 16GB", :description => %{<p>16GB Wifi 3G<p>}, :category_id => 10, :image_url => '../images/heroes/004.gif', :price => 15000000)
  Product.create(:name => "Apple iPad2 32GB", :description => %{<p>32GB Wifi 3G<p>}, :category_id => 10, :image_url => '../images/heroes/005.gif', :price => 17000000)

 # Product.create(:name => "Eagle", :category_id => 10, :description => %{<p>Sky Master</p>}, :image_url => '../images/products/1.jpg')
      # 1 Laptop: 11 Acer
  # 1 Laptop: 12 Apple
  # 1 Laptop: 13 Asus
  # 1 Laptop: 14 IBM - Lenovo
  # 1 Laptop: 15 HP - Compaq
  # 1 Laptop: 16 Dell
  # 1 Laptop: 17 Toshiba
  # 1 Laptop: 18 Samsung
  # 1 Laptop: 19 Others
  
  # 2 Desktop: 20 Intel
  # 2 Desktop: 21 Toky
  # 2 Desktop: 22 IBM - Lenovo
  # 2 Desktop: 23 Others
  
  # 3 Memory: 24 DDR SDRAM
  # 3 Memory: 25 DDR SDRAM2
  # 3 Memory: 26 DDR SDRAM3
  # 3 Memory: 27 Others
  
  # 4 Monitor: 28 Acer
  # 4 Monitor: 29 Asus
  # 4 Monitor: 30 LG
  # 4 Monitor: 31 Samsung
  # 4 Monitor: 32 Dell
  # 4 Monitor: 33 HP
  # 4 Monitor: 34 Others
  
  # 5 Flash Drive: 35 Kingmax
  # 5 Flash Drive: 36 Kingston
  # 5 Flash Drive: 37 Apacer
  # 5 Flash Drive: 38 Transcend
  # 5 Flash Drive: 39 JVJ
  # 5 Flash Drive: 40 Others
  
  # 6 CPU: 41 Intel
  # 6 CPU: 42 AMD
  # 6 CPU: 43 Others
  
  # 7 Keyboard & Mouse: 44 Keyboard
  # 7 Keyboard & Mouse: 45 Mouse
  # 7 Keyboard & Mouse: 46 Others
  
  # 8 Peripherals: 47 Speaker
  # 8 Peripherals: 48 Headphone
  # 8 Peripherals: 49 ODD
  # 8 Peripherals: 50 HDD
  # 8 Peripherals: 51 Webcam
  # 8 Peripherals: 52 Case
  # 8 Peripherals: 53 Power Supply
  # 8 Peripherals: 54 Router
  # 8 Peripherals: 55 Others
  
  # 9 Card: 56 VGA Card
  # 9 Card: 57 Sound Card
  # 9 Card: 58 Tivi Card
  # 9 Card: 59 Network Card
  # 9 Card: 60 Others
  
  end

  def self.down
    #Product.all.each{|p| p.destroy}
  end
end
