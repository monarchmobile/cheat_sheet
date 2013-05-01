# list of all of the tasks available from the current Rake file
rake -T

# To run a named task, specify the name of the task:
rake my_task

# To run a Rake file or directory task, use the name of the file or directory:
rake mydoc.pdf

# specifing options
# --quiet #suppresses any output
rake my_task --quiet
rake --quiet my_task

# Each task definition consists of:
# A description
# The name that identifies the task
# The code to be executed by the task
desc "One line task description"
task :name_of_task do
  # Your code goes here
end

# This task depends on two other tasks:
desc "Example of a task with prerequisites"
task :third_task => ["first_task", "second_task"] do
  # Your code goes here
end

# To run a task
rake name_of_task

# Input Parameters for Tasks
# Rake refers to the input parameters for tasks as arguments. 
# This task has both arguments and prerequisites:
desc "Example of task with parameters and prerequisites"
task :my_task, [:first_arg, :second_arg] => ["first_task", "second_task"] do |t, args|
  args.with_defaults(:first_arg => "Foo", :last_arg => "Bar")
  puts "First argument was: #{args.first_arg}"
  puts "Second argument was: #{args.second_arg}"
end
	# The first line of the task assigns default values to the arguments.
	# To run a task that requires arguments, we must specify the values for 
	# each of the arguments after the name of the task:
	# rake my_task[one,two]


namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
