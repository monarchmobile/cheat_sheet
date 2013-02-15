	2.3
	new_record? instance method
	# determines if an object is already in the database

	# validations happen before save or before update
	# methods that trigger validations and will save to db only if object is valid 
	create, create!, save, save!, update, update_attributes, update_attributes!

	bank versions => raise an exception if object is invalid
	
	2.4
	# valid? and invalid?
	valid? triggers validations and returns true if no errors found on the object
		# example
		p = Person.new
		>> p.valid?
		=> false
		>> p.errors
		=> {:name=>["can't be blank"]}
	invalid? triggers validation and returns true if there are errors found on the object
	2.5
	errors[]
	validates whether or not a particular attribute of an object is valid
		=> use errors[:attribute]
		returns an array of all errors for particular attribute
		no errors on attribute returns empty array
	method only used after validations have been run b/c it only inspects the errors
	collection and does not trigger validations itself

3 Validation Helpers
	all accept the :on and :message options
		:on => :save, :create, :update 
		:message => there is a default message for each validation when message not specified
	3.1 acceptance
		validates that a checkbox on the user interface was checked when a form was submitted
		# example
		class Person < ActiveRecord::Base
		  validates :terms_of_service, :acceptance => true
		end

		#message
		default => "must be accepted"

		# options
		:accept => determines value that will be considered accepted. Defaults to "1"
			# example
			class Person < ActiveRecord::Base
			  validates :terms_of_service, :acceptance => { :accept => 'yes' }
			end
	3.2 validates_associated
		use when your model has associations with other models
		when saved, valid? will be called on each of associated objects	
		# example 
		class Library < ActiveRecord::Base
		  has_many :books
		  validates_associated :books
		end
		# message
		default => "is invalid"
	3.3 confirmation
		two text fields that should receive exactly the same content ie. password
		creates virtual attribute
		# example 
		class Person < ActiveRecord::Base
		  validates :email, :confirmation => true
		end
		# template example
		<%= text_field :person, :email %>
		<%= text_field :person, :email_confirmation %>

		check is only performed if email_confirmation is not nil.  To require confirmation
		make sure to a presence check for the confirmation attribute
		# example 
		class Person < ActiveRecord::Base
		  validates :email, :confirmation => true
		  validates :email_confirmation, :presence => true
		end
	3.4 exclusion
		validates that the attributes values are not included in a given set
		# example 
		class Account < ActiveRecord::Base
		  validates :subdomain, :exclusion => { :in => %w(www us ca jp),
		    :message => "Subdomain %{value} is reserved." }
		end
		# options 
		:in => receives the set of value that will not be accepted for the validated attributes
	3.5 format
		validates values by testing whether they match a given regex, specified using the
		:with options
		# example 
		class Product < ActiveRecord::Base
		  validates :legacy_code, :format => { :with => /\A[a-zA-Z]+\z/,
		    :message => "Only letters allowed" }
		end
	3.6 inclusion
		validates attributes values are included in a given set
		# example
		class Coffee < ActiveRecord::Base
		  validates :size, :inclusion => { :in => %w(small medium large),
		    :message => "%{value} is not a valid size" }
		end
		# options 
		:in => receives the set of valuse that will be accepted
	3.7 length
		validates the length of the attributes values with multiple options
		# example
		class Person < ActiveRecord::Base
		  validates :name, :length => { :minimum => 2 }
		  validates :bio, :length => { :maximum => 500 }
		  validates :password, :length => { :in => 6..20 }
		  validates :registration_number, :length => { :is => 6 }
		end
		# options 
		:minimum, :maximum, :in, :is (equal to)
		# messages 
		pesonalize with :wrong_length, :too_long, :too_short
		# count as placeholder, matches length contraint value
		# example
		class Person < ActiveRecord::Base
		  validates :bio, :length => { :maximum => 1000,
		    :too_long => "%{count} characters is the maximum allowed" }
		end
	3.8 numericality
		validates that your attributes have only numeric values
		# options
		:only_integer => true (only accepts integers)
		# example
		class Player < ActiveRecord::Base
		  validates :points, :numericality => true
		  validates :games_played, :numericality => { :only_integer => true }
		end
		# other options
		:greater_than, 
		:greater_than_or_equal_to, 
		:equal_to, 
		:less_than, :less_than => 5
		:less_than_or_equal_to, 
		:odd, :odd => true
		:even
	3.9 presence 
		validates that the specified attributes are not empty. Uses blank? method
		to check if the value is either nil or a blank string
		# example
		class Person < ActiveRecord::Base
		  validates :name, :login, :email, :presence => true
		end
		to validate the presence of a boolean, false.blank? is true
		use :inclusion => { :in => [true, false]}
	3.10 uniqueness
		validates is unique before it is saved
		# example
		class Account < ActiveRecord::Base
		  validates :email, :uniqueness => true
		end
		works by performing a query for any record with same value in attribute
		can add :scope option to add other attributes
		# example 
		class Holiday < ActiveRecord::Base
		  validates :name, :uniqueness => { :scope => :year,
		    :message => "should happen once per year" }
		end

5 Conditional validation
	5.1 Using a Symbol with :if and :unless 
	use if or unless with a symbol corresponding to the name of a method that
	will get called right before the validation happens
	# example 
	class Order < ActiveRecord::Base
	  validates :card_number, :presence => true, :if => :paid_with_card?
	 
	  def paid_with_card?
	    payment_type == "card"
	  end
	end



