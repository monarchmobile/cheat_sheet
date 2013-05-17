----- index -----
Generate a model or controller
scaffold
mailer
add column
delete a column
add multiple columns
association belongs_to (with t.references)
common data definition tasks
column types
Change a Table
rake tasks namespace
create table migration file
----- index ---------

# Generate a model or controller or both
rails g model Post
rails g scaffold Post
rails g controller Posts

rails g model Product name:string description:text

# Adds a new Scaffold
rails generate scaffold Post name:string title:string content:text

# adds a new mailer
rails g mailer user_mailer password_reset # (identifies as mailer, name of mailer, mailer actions)

# add column
$ rails g migration AddPartNumberToProducts part_number:string
def change
	add_column :products, :part_number, :string
end

# delete a column
rails generate migration RemovePartNumberFromProducts part_number:string
def up
	remove_column :products, :part_number
end

def down
	add_column :products, :part_number, :string
end

# add multiple columns
$ rails generate migration AddDetailsToProducts part_number:string price:decimal

  add_column :products, :part_number, :string
  add_column :products, :price, :decimal


# association belongs_to, just name the model, rails will add _id
create_table :products do |t|
  t.references :category
end

# common data definition tasks
add_column :my_table, :column_name, :type
add_index
change_column :table_name, :column_name, :date
change_table
create_table
drop_table :table_name
remove_column :table_name, :column_name
remove_index
rename_column :users, :name, :username
rename_column :my_table, :old_name, :new_name

# column types
:binary
:boolean
:date
:datetime
:decimal
:float
:integer
:primary_key
:string
:text
:time
:timestamp

# Change a Table
class AddReceiveNewsletterToUsers < ActiveRecord::Migration
  def up
  	# adds receive_newsletter to table with default = false
    change_table :users do |t|
      t.boolean :receive_newsletter, :default => false
    end
    # updates existing users with receive_newsletter = true
    User.update_all ["receive_newsletter = ?", true]
  end
 
  def down
    remove_column :users, :receive_newsletter
  end
end

# examplie of rake tasksnamespace :user do
  desc "Rebuild Auth-Tokens"
  task :rebuild_auth_token => :environment do
    User.transaction do
      User.all.each { |u|
        u.generate_token(:auth_token)
        u.save!
      }
    end
  end
end  
# It's placed in lib/tasks/rebuild_token_auth.rake
# then you can run it with

rake user:rebuild_auth_token

# create table migration file
class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.text :description
 
      t.timestamps
    end
  end
 
  def down
    drop_table :products
  end
end