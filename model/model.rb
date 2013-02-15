----- index -----
scope
to_param
temporary user
----- index ---------

# scopes 
	class Post < ActiveRecord::Base
	  scope :published, where(:published => true)
	  scope :expiration, where(["expiration > ?", Date.today])

	  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

	  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}
	end

	scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}

# to_param
def to_param
    [id, full_name.parameterize].join("-")
end

# Create temporary User
def method
	user ||= User.new # Guest user
end