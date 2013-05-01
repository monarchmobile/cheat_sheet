1)
	rails g devise:install
	rails g devise user
	rake db:migrate
	rails g devise:views
	rails g migration add_username_to_users username

2)
Gemfile
gem 'devise'

3) 
add MAILER_HOST to application.yml

4) #header functions
<% if user_signed_in? %>
  Logged in as <strong><%= current_user.email %></strong>.
  <%= link_to 'Edit profile', edit_user_registration_path %> |
  <%= link_to "Logout", destroy_user_session_path, method: :delete %>
<% else %>
  <%= link_to "Sign up", new_user_registration_path %> |
  <%= link_to "Login", new_user_session_path %>
<% end %>

5)
config/routes.rb
devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
# push devise_for above as below:
	devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
	mount Piggybak::Engine => '/checkout', :as => 'piggybak'
  	mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

6) # optional 
config/initializers/devise.rb
config.authentication_keys = [ :username ]
config.case_insensitive_keys = [ :username ]
config.strip_whitespace_keys = [ :username ]

articles_controller.rb
before_filter :authenticate_user!, except: [:index, :show]

7)
mkdir app/controllers/users
touch app/controllers/users/registrations_controller.rb

class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication
 
  def check_permissions
    authorize! :create, resource
  end
end


