include CanCan::Ability
# This refers to including the abilty modele

load_and_authorize_resource
	# This replaces
	 @intance = Instance.find(params[:id])

rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied!"
  redirect_to root_url 
end

1)
gemfile
	gem 'cancan'

2)
create app/models/ability.rb
	file ability.rb

	class Ability
	  include CanCan::Ability
	  
	  def initialize(user)
	    user ||= User.new # guest user
	    
	    if user.role? :admin
	      can :manage, :all
	    else
	      can :read, :all
	    end
	      
	  end
	end

3) application_controller.rb 
	rescue_from CanCan::AccessDenied do |exception|
	  flash[:error] = "Access denied."
	  redirect_to root_url
	end