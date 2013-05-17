# encoding: utf-8

# set up new User or keep user1
createuser new_user_name

# set up Database
createdb -Ouser1 -Eutf8 new_app_name_development
createdb -Ouser1 -Eutf8 new_app_name_test

# check database
psql postgres
\l

# create new app
rails new new_app_name -d postgresql
## new app with template ##
rails new test1 --database=postgresql -m ~/sites/startup_template/monarchTemplate.rb

# clone from git
git clone git@github.com:monarchmobile/church.git church
git clone (ssh git address) new_app_folder_name_on_local_computer
cd new_app

bundle install
rake db:migrate

# add new repository
git remote add origin git@github-monarch:monarchmobile/church.git
git remote add origin git@github-monarch:monarchmobile/new_repo.git (rod to monarch)
git remote add origin git@github:rodmanhe/new_repo.git (rod to rod)
git remote add origin git@github:monarchmobile/new_repo.git (andrew to monarch)

# change user in ‘database.yml’ to whatever user you used in db creation
development:
 username: user1
 # checkout cheat_sheet/config/database.yml

# applicaiton.yml
create config/application.yml
	# checkout cheat_sheet/config/application.yml

# allow gmail access for mailer
	https://accounts.google.com/DisplayUnlockCaptcha
	config.mailer_sender = "monarchmobile2@gmail.com" # add this on line 7 to intializers/devise.rb
# change gmail password on heroku app
heroku config:add GMAIL_PASSWORD=lkasjdflkm 

# unset config key
heroku config:unset SECRET_KEY --remote staging

# no heroku app yet
if no heroku app
	heroku create
	git push heroku master


	heroku config:add GMAILER_USERNAME=monarchmobile2@gmail.com GMAIL_PASSWORD=aslkdhf SECRET_TOKEN=.... and so on, (MAILER_HOST, and AWS creditials if needed)

	heroku run rake db:migrate
else
	git push heroku master

	# rm public file
rm public/index.html

# config/routes.rb
root :to => ‘new_controller#method’

# config/application.rb
config.assets.initialize_on_precompile = false

# add these gems to gem file
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'jquery-ui-rails'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'client_side_validations'
gem 'best_in_place'
gem 'friendly_id'
# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'thin'
#upload photos
gem "rmagick"
gem "carrierwave"