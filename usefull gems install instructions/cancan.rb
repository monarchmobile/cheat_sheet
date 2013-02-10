include CanCan::Ability
# This refers to including the abilty modele

load_and_authorize_resource
	# This replaces
	 @intance = Instance.find(params[:id])

rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied!"
  redirect_to root_url
end