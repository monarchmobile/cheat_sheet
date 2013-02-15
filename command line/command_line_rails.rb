----- index -----
quick commands
reset database
----- index ---------

# quick commands
ctrl "T" #new tab 

# reset database 
	rake db:reset

pwd # tells you what directory you are in

# getter
def first_name
	@first_name
end

# setter
def first_name=(first_name)
	@first_name = first_name
end

User.first_name=('jeff')

attr_accessible :first_name

User.create(first_name: "John")

User.update_attributes(first_name: new_name)

<div class="field">
	<%= f.label :first_name %>
	<%= f.text_field :first_name %>
</div>

User.first_name


