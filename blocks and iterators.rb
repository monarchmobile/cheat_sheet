array literal = set of elements between []
	a = [ 1, 'cat', 3.14 ] # array with three elements
	a = %w{ ant bee cat dog elk }

hash literal = set of elements between {}
	inst_section = {
	'cello' => 'string',
	'clarinet' => 'woodwind',
	'drum' => 'percussion',
	'oboe' => 'woodwind',
	'trumpet' => 'brass',
	'violin' => 'string'
	}

writing to console
	p inst_section['oboe'] # => "woodwind"

hash by default returns nil when indexed to a key that does not exist
create default value to zero
	histogram = Hash.new(0) # The default value is zero
	histogram['ruby'] # => 0
	histogram['ruby'] = histogram['ruby'] + 1
	histogram['ruby'] # => 1

symbol literal starts with a colon, and
is normally followed by some kind of name.

gets()
	# returns the next line from standard input stream or nil when it reaches
	# the end of the file
	# example 
	while line = gets
		puts line.downcase
	end
Blocks and Iterators
	code blocks are chucks of code between []s  or do..end
		{ puts "Hello" }
		do
			club.enroll(person)
			person.socialize
		end
	blocks are associated with a call to a method
	method + block 
		greet { puts "hi" }
		verbose_greet("Dave", "loyal customer") { puts "Hi" }

	yield performs task in block
		def call_block
			puts "Start of method"
			yield
			yield
			puts "End of method"
		end
		call_block { puts "In the block" }
		produces:
			Start of method
			In the block
			In the block
			End of method
		The code in the block (puts "In the block") is executed twice, once for each call to yield.

	providing arguements to the call to yield => these are passed to the block
		list names of params to receive these arguments between |  |
		# example
		def who_says_what
			yield("Dave", "hello")
			yield("Andy", "goodbye")
		end
		who_says_what {|person, phrase| puts "#{person} says #{phrase}"}
		produces:
			Dave says hello
			Andy says goodbye

