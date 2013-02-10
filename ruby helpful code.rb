----- index -----
requested user path
gsub
passing a block
----- index ---------

# requested user path
request.env['REQUEST_PATH'] # user requested path

# gsub
gsub()
	# it returns a copy of string based upon our requirement
	"hello".gsub(/[aeiou]/, '*')=> "h*ll*" 

# pass a block which will pass in the instance of the model when 
# are checking.  The block will return true or false
# && 
# There’s a possibility that the comment might be nil so we’ll use Rails’ 
# try method to read the user attribute so that nil is returned if the 
# comment is nil instead of an exception being raised.
# comment.try(:user)

# passing a block
can :update, Comment do |comment|
	comment.try(:user) == user
end