# define abilities

class Ability
  include CanCan::Ability
  
  def initialize(user)
  	user || User.new
  	#:action, :model
  	#:read => see only
  	#:manage => can perform every action
  	#:all => every model
  	if user.role? :admin
  		can :manage, :all
  	else
  		can :read, :all
  		can :create, Comment
  		can :update, Comment do |comment|
  			comment.try(:user) == user || user.role?(:moderator) #checks if comment belongs to user
  		end

  		if user.role? :author
  			can :create, Article 
  			can :update, Article do |article|
  				article.try(:user) == user
  			end
  		end
  	end

  end

end

# can [:index], :all    #show index  
      # can [:show], :all    #show show   
      # can [:index], User    # does not work
      # can [:show], User    #show show


# Restrict View Layer
#can? checks access to abilities (2 args)
#:action, :model
# if yes, user can see action button "Edit"

"link_to "Edit", edit_article_path(@article) if can? :update, @article " 


# Restrict Controller Layer
# if restful style Controller
load_and_authorize_resource