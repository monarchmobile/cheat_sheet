1) # gemfile
gem "piggybak"

2) # command line
	a) bundle install
	b) piggybak install

3) #If you are using CanCan for Authorization in RailsAdmin, add the code below to your ability class to allow access to Piggybak's models. Refer to the demo source code for an example:

can :manage, Piggybak.config.manage_classes.map(&:constantize)
Piggybak.config.extra_abilities.each do |extra_ability|
  can extra_ability[:abilities], extra_ability[:class_name].constantize
end
								