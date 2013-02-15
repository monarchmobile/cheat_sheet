# encoding: utf-8
---- index -------
Validations for boolean = true

---- index -------

#encoding: utf-8
Validations.rb

# *** START Custom Validations ***
    #create a new lib folder
    mkdir lib/validators  

    # add to /config/application.rb so app know where to look for custom validations
    config.autoload_paths += Dir["#{config.root}/lib/**/"] 

    # create new class validators in following format
    email_pattern_validator.rb # name of file

    class EmailPatternValidator < ActiveModel::EachValidator  
      def validate_each(record, attribute, value)  
        if value.nil? || !value.match(/^([\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+\.)*[\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i)  
          record.errors[attribute] << "Not a valid email address"  
        end  
      end  
    end 

    # call during validation
    validates :email, :email_pattern => true 
 # *** END Custom Validations ***

 errors.add(:storage, "The storage you entered is beyond the capacity of store.")

# *** START Rails Validation ***
:acceptance => Boolean
:confirmation => Boolean
:exclusion => { :in => Ennumerable }
:inclusion => { :in => Ennumerable }
:format => { :with => Regexp }
:length => { :minimum => Fixnum, :maximum => Fixnum, }
:numericality => Boolean
:presence => Boolean
:uniqueness => Boolean

# checkbox has to be checked when submitting form
validates :terms_of_service, :acceptance => true
# confirm a textfield
validates :email, :confirmation => true
"<%= text_field :person, :email %>"
"<%= text_field :person, :email_confirmation, presence: true %>"
# This helper validates the attributes’ values by testing whether 
# they match a given regular expression, which is specified using the :with option.
validates :legacy_code, :format => { :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }
# This helper validates the length of the attributes’ values
validates :name, :length => { :minimum => 2 }
validates :bio, :length => { :maximum => 500 }
validates :password, :length => { :in => 6..20 }
validates :registration_number, :length => { :is => 6 }
validates :content, :length => {
    :minimum   => 300,
    :maximum   => 400,
    :tokenizer => lambda { |str| str.scan(/\w+/) },
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }

# This helper validates that your attributes have only numeric values
validates :points, :numericality => true
validates :games_played, :numericality => { :only_integer => true }
	# added options
	:greater_than – Specifies the value must be greater than the supplied value. The default error message for this option is “must be greater than %{count}”.
	:greater_than_or_equal_to – Specifies the value must be greater than or equal to the supplied value. The default error message for this option is “must be greater than or equal to %{count}”.
	:equal_to – Specifies the value must be equal to the supplied value. The default error message for this option is “must be equal to %{count}”.
	:less_than – Specifies the value must be less than the supplied value. The default error message for this option is “must be less than %{count}”.
	:less_than_or_equal_to – Specifies the value must be less than or equal the supplied value. The default error message for this option is “must be less than or equal to %{count}”.
	:odd – Specifies the value must be an odd number if set to true. The default error message for this option is “must be odd”.
	:even – Specifies the value must be an even number if set to true. The default error message for this option is “must be even”.


# This helper validates that the specified attributes are not empty
validates :name, :login, :email, :presence => true

validates :field_name, :inclusion => { :in => [true, false] }.

# This helper validates that the attribute’s value is unique right before 
# the object gets saved.
validates :email, :uniqueness => true

	# There is a :scope option that you can use to specify other attributes that are 
	# used to limit the uniqueness check:
	validates :name, :uniqueness => { :scope => :year,
    :message => "should happen once per year" }

    # There is also a :case_sensitive option that you can use to define whether the 
    # uniqueness constraint will be case sensitive or not. This option defaults to true.
    validates :name, :uniqueness => { :case_sensitive => false }

# The :allow_nil option skips the validation when the value being validated is nil.
validates :size, :inclusion => { :in => %w(small medium large),
    :message => "%{value} is not a valid size" }, :allow_nil => true

# The :allow_blank option is similar to the :allow_nil option. This option will let 
# validation pass if the attribute’s value is blank?, like nil or an empty string for example.
validates :title, :length => { :is => 5 }, :allow_blank => true

# Validations for boolean = true
  with_options :if => :listed? do |l|
    l.validates_presence_of :email
    l.validates_length_of :description, :minimum => 100
  end



