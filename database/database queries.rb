----- index -----
finder methods
Retrieving a single object
Retrieving Multiple Objects 
Conditions (array, range, subset conditions, order, select, 
	unique, limit, offset, group, pluck, exist)
calculations
----- index ---------


# finder methods
	# To retrieve objects from the database, Active Record provides several 
	# finder methods. Each finder method allows you to pass arguments into it 
	# to perform certain queries on your database without writing raw SQL.
	where
	select
	group
	order
	reorder
	reverse_order
	limit
	offset
	joins
	includes
	lock
	readonly
	from
	having

# Retrieving a single object 

client = Client.find(10) # SELECT * FROM clients WHERE (clients.id = 10) LIMIT 1

client = Client.first # SELECT * FROM clients LIMIT 1

client = Client.last # SELECT * FROM clients ORDER BY clients.id DESC LIMIT 1

# Retrieving Multiple Objects

# Using Multiple Primary Keys
client = Client.find([1, 10]) 
Client.find(1, 10) # SELECT * FROM clients WHERE (clients.id IN (1,10))

# Conditions 
# array
Client.where("orders_count = ?", params[:orders])
Client.where("orders_count = ? AND locked = ?", params[:orders], false)

# range
Client.where(:created_at => (Time.now.midnight - 1.day)..Time.now.midnight)

# subset conditions 
Client.where(:orders_count => [1,3,5])

# order 
Client.order("created_at DESC")
Client.order("orders_count ASC, created_at DESC")

# select 
Client.select("viewable_by, locked")

# If you would like to only grab a single record per unique value in a certain field, you can use uniq:
Client.select(:name).uniq

# limit 
Client.limit(5)

# offset will return instead a maximum of 5 clients beginning with the 31st
Client.limit(5).offset(30)

# Group For example, if you want to find a collection of the dates orders were created on:
Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
#And this will give you a single Order object for each date where there are orders in the database.

# having on select.group
Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)").having("sum(price) > ?", 100)
# This will return single order objects for each day, but only those that are ordered more than $100 in a day.

# first-or-create
Client.where(:first_name => 'Andy').first_or_create(:locked => false)
Client.find_or_create_by_first_name(:first_name => "Andy", :locked => false)

# pluck 
Client.where(:active => true).pluck(:id)

# exists 
Client.exists?(1)
Client.exists?(1,2,3) # if any are true
Client.where(:first_name => 'Ryan').exists?
Client.exists?

#calulations
Client.count

count, average, minimum, maximum, sum,





