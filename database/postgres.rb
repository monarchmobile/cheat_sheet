# pull up list of databases
psql -U user1 referral_app_development
\q (get out of db)

# create new databases
createdb -Ouser1 -Eutf8 #{@app_name}_development

# reset db
rake db:reset

# rollback db to version 0
rake db:migrate VERSION=0

# drop db
dropdb outpouring_development

# creat database
createdb -Ouser1 -Eutf8 outpouring_development

heroku pg:reset DATABASE_URL

# To drop the database, if you are using SHARED_DATABASE_URL:
heroku pg:reset DATABASE
# To recreate the database with nothing in it:
heroku run rake db:migrate
# To populate the database with your seed data:
heroku run rake db:seed
# You can combine the last two into one action by executing this:
heroku run rake db:setup

# wipe database clean
heroku pg:reset --app infinite-thicket-3285 DATABASE_URL


