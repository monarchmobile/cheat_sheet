rails g migration drop_rails_admin_histories

ps auxwww |grep ruby
	pgrep ruby # a different command same result
	kill # kill stalled process id

# reset database 
	rake db:reset

# clean assets
	rake assets:clean 

git fetch
git merge origin/master

git checkout -b branch_name
	# program away.....
rake assets:precompile
git add .
git commit -m"whatever"
git push

git checkout master
git fetch
git merge origin/master

git merge branchname
git push

git push heroku master
#if new migrations
	heroku run rake db:migrate

