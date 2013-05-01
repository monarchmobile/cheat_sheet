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

# for rod pushing from monarch git ==> heroku production
# need to add production url to git remote
git remote add staging git@heroku.com:quiet-thicket-3184.git 
git remote add production git@heroku.com:infinite-thicket-3285.git 
git remote add staging git@heroku.com:young-dusk-3425.git


# remove a remote
git remote rm staging

#raking
heroku run rake db:migrate --app quiet-thicket-3184
heroku run rake db:migrate --app infinite-thicket-3285

#drop table without migration through command line
$ heroku console
Ruby console for heroku-project-name
>> ActiveRecord::Migration.drop_table(:orders)

# if you wanted “staging” do be your default 
# remote, you could set it with the following command:
git config heroku.remote staging

# optional at this point
heroku config:add RACK_ENV=staging RAILS_ENV=staging --remote staging

heroku config:add S3_KEY=XXX --remote staging
heroku config:add S3_SECRET=YYY --remote staging

# git merge when force to merge with messagex
git merge styling -m "this is my commit"


# create staging from production

heroku addons
heroku create --remote staging --addons newrelic:standard,loggly:mole,...


# git staging branch to staging heroku
git push staging staging:master

staging:master => <branch>:master



