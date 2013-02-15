# items you might find in application_controller and how to call methods
# that are placed in application controller

--- index ---
calling method from view
--- index ---

###### calling method from view ########
	application_controller.rb
	def category_name
	    "RubyOnRails"
	end

	helper_method :category_name

	# can now render in any view
	<%= category_name %>