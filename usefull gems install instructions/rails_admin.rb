# Gemfile
# **important**
# if also installing piggybak, do complete install of rails_admin before starting piggybak.
# There may be conflicts otherwise
gem 'rails_admin'

#command line
bundle install
rails g rails_admin:install

# config/routes.#!/usr/bin/env ruby -wKUdevise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'


# command line add some line that initializer created
rake db:migrate