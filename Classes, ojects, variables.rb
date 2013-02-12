class BookInStock
	def initialize(isbn, price)
		@isbn = isbn
		@price = price
	end
end

b1 = BookInStock.new("isbn1", 3)
p b1
puts b1
#<BookInStock:0x0a37f0 @isbn="isbn1", @price=3.0>
#<BookInStock:0x0a38cc> => class_name:object_id (a hexidecimal number )
---------------------------------
class BookInStock
	def initialize(isbn, price)
		@isbn = isbn
		@price = price
	end
	def to_s
		"ISBN: #{isbn}, price: #{price}"
	end
end

puts b1
ISBN: isbn1, price: 3.0

---------------------------------
class BookInStock
	def initialize(isbn, price)
		@isbn = isbn
		@price = price
	end
	def to_s
		"ISBN: #{isbn}, price: #{price}"
	end
	def isbn
		@isbn
	end
	def price
		@price
	end
end
---------------------------------
class BookInStock
	attr_reader :isbn, :price
	def initialize(isbn, price)
		@isbn = isbn
		@price = price
	end
	def to_s
		"ISBN: #{isbn}, price: #{price}"
	end
	
end
---------------------------------
class BookInStock
	attr_reader :isbn, :price
	def initialize(isbn, price)
		@isbn = isbn
		@price = price
	end
	def to_s
		"ISBN: #{isbn}, price: #{price}"
	end
	def price=(new_price)
		@price = new_price
	end
	
end
	book = BookInStock.new("isbn1", 33.80)
	puts "ISBN = #{book.isbn}"
	puts "Price = #{book.price}"
	book.price = book.price * 0.75 # discount price
	puts "New price = #{book.price}"
---------------------------------
class BookInStock
	attr_reader :isbn, :price
	attr_accessor :price
	def initialize(isbn, price)
		@isbn = isbn
		@price = price
	end
	def to_s
		"ISBN: #{isbn}, price: #{price}"
	end
end
	book = BookInStock.new("isbn1", 33.80)
	puts "ISBN = #{book.isbn}"
	puts "Price = #{book.price}"
	book.price = book.price * 0.75 # discount price
	puts "New price = #{book.price}"


require 'csv'
require_relative 'books_in_stock'
class CsvReader
	def initialize
		@books_in_stock = []
	end
	def read_in_csv_data(csv_file_name)
		CSV.foreach(csv_file_name, headers: true) do |row|
			@books_in_stock << BookInStock.new(row["ISBN"]), row["Amount"]
		end
	end
	def total_value_in_stock
		sum = 0.0
		@books_in_stock.each {|book| sum += book.price}
		sum
	end
	def number_of_each_isbn

	end
end

stock_stats.rb
	require_relative 'csv_reader'
	reader = CsvReader.new
	ARGV.each do |csv_file_name|
		STDERR.puts "Processing #{csv_file_name}"
		reader.read_in_csv_data(csv_file_name)
	end
	puts "Total value = #{reader.total_value_in_stock}"
