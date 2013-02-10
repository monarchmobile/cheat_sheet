RAILSCASTs 85, yaml configuration
# local setting and heroku settings
----- index -----
development.rb and production.rb 
application.yml
application.rb
initializers/secret_token.rb
----- index ---------

# local
# place dynamic variables in smtp_settings for development.rb & production.rb 
# Gmail
user_name: ENV["GMAIL_USERNAME"],
password: ENV["GMAIL_PASSWORD"]

# create an "application.yml" file in /config

# define new variables in application.yml
GMAIL_USERNAME: "person@gmail.com"
GMAIL_PASSWORD: "password"

# add this line of code after first bundle.  This loads new vars and updates them to ENV variables

# config = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))
# config.merge! config.fetch(Rails.env, {})
# config.each do |key, value|
#   ENV[key] = value unless value.kind_of? Hash
# end
local_ENVs = File.expand_path('../application.yml', __FILE__)
if File.exists?(local_ENVs)
    config = YAML.load(File.read(local_ENVs))
    config.merge! config.fetch(Rails.env, {})
    config.each do |key, value|
      ENV[key] = value unless value.kind_of? Hash
    end
end

# do same for config/initializers/secret_token
= ENV["SECRET_TOKEN"]
SECRET_TOKEN: "alksjdlfkjsdlkfjslkdajfa;lksjdf;klj"

# do same for config.action_mailer.default_url_options
# delete from development.rb and production.rb, add to application.rb 
config.action_mailer.default_url_options = { host: ENV["MAILER_HOST"] }

development:
  MAILER_HOST: "localhost:3000"

production:
  MAILER_HOST: "examplesite.com"

# Heroku settings
# set ENV[vars] in heroku
heroku config:add GMAIL_USERNAME=monarchmobile2@gmail.com GMAIL_PASSWORD=Butterfly787 MAILER_HOST=http://desolate-hamlet-9952.herokuapp.com 
do the SECRET_TOKEN as well

# trouble shooting
make sure gmail is accepting the sign in
