# create a staging app in heroku
heroku create --remote staging
git push staging master
heroku run rake db:migrate --remote staging
heroku ps --remote staging

# create a production app in heroku
heroku create --remote production
git push production master
heroku run rake db:migrate --remote production
heroku ps --remote production

# if you wanted “staging” do be your default 
# remote, you could set it with the following command:
git config heroku.remote staging

# optional at this point
heroku config:add RACK_ENV=staging RAILS_ENV=staging --remote staging

heroku config:add S3_KEY=XXX --remote staging
heroku config:add S3_SECRET=YYY --remote staging


# create staging from production

heroku addons
heroku create --remote staging --addons newrelic:standard,loggly:mole,...