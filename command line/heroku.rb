# quick commands
	heroku restart	#restart the server
	heroku run console #start console on heroku

# database
	heroku run rake db:reset # reset database
	heroku run rake db:migrate # rake database

# view
git remote -v (for heroku app)
list of folders
named_folder url_address

# login
	heroku login

# create new_app
	heroku create # you need to be in the sites/new_app_folder

# config:add whatever
	heroku config:add GMAIL_USERNAME=monarchmobile2@gmail.com GMAIL_PASSWORD=Butterfly787 MAILER_HOST=http://desolate-hamlet-9952.herokuapp.com 

	# if you have reset the head on git to rollback changes, and then push
# heroku will fail.  You must do a force here also

git push heroku master --force

# add heroku account to git repe
git remote add heroku git@heroku.com:<heroku_app>.git