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

4)
# The def initialize user bit is for guest users. We'll need to add these lines to our user model:
 def role?(role)
   return !!self.roles.find_by_name(role.to_s)
 end

5) 
# And while we have the user model open, lets setup a default role for new users. Lets make new users automatically authors:
# before_create :setup_role
private
def setup_role
  if self.role_ids.empty?
    self.role_ids = [3]
  end
end

6)
rails console
r = Role.new
r.name = "Admin"
r.save
r = Role.new
r.name = "Moderator"
r.save
r = Role.new
r.name = "Member"
r.save

# 7) set a user up with admin priviledges
u = User.first
u.role_ids
u.role_ids = [1]
u.save
u.role_ids

8)
# Lets start restricting access to the blog application based on user 
# role. We'll need to restrict access to controller actions, by role, 
# and then hide links for roles without the required permission level 
# to access the controller actions as well. To restrict access to the 
# article controller actions we'll need to add the following to the 
# respective controller actions:
authorize! :edit, @article
authorize! :create, @article
authorize! :update, @article
authorize! :destroy, @article

9)
# restrict edit/delete buttons in html
<% if can? :update, article  %>
  <%= link_to 'Edit', edit_article_path(article) %>
<% end %>