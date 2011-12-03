class Book
  attr_accessor :name, :author
  attr_reader :year
  
  def year=(y)
   @year = y + 1
   puts "end of "  + @year.to_s
  end
  
  def year
    puts @year+2
  end
end

b = Book.new
b.year = 2011
b.year
