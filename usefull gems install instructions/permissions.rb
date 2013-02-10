----- index -----
before_filter
current_permission
authorize
permission.rb
----- index ---------

# Creating permission within app
# add before_filter to given controller to authorize certain views
before_filter :authorize, only: [:edit, :update]


def current_permission
	@current_permission || Permission.new(current_user)
end

def authorize
	if !current_permission.allow?(params[:controller], params[:action])
		redirect_to root_url, notice: "access denied"
	end
end

# create new model (not attached to active record)
permission.rb 

class permission < Structure.new(:user)
	def allow?(controller, action)

	end
end