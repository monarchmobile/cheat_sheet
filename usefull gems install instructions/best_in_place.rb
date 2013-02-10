# assets/javascript/application.js 
# done already in template
# //= require best_in_place
# //= require best_in_place.purr

# /app/assets/javascripts/users.js.coffee
jQuery ->
  $('.best_in_place').best_in_place()

# html show page
"<%= best_in_place @user, :name %>"

# update method in controller
def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
end

<%= best_in_place @user, :country, :type => :select, :collection => [[1, "Spain"], [2, "Italy"], [3, "Germany"], [4, "France"]] %>
<%= best_in_place @user, :receive_emails, :type => :checkbox, :collection => ["No, thanks", "Yes, of course!"] %>

<!-- Best in Place -->
  <!-- drop down  -->
  <p>
    <b>Gender:</b>
    <%= best_in_place @user, :gender, type: :select, collection: [["Male", "Male"], ["Female", "Female"], ["", "Unspecified"]] %>
  </p>

  <!-- boolean -->
  <p>
    <b>Public profile:</b>
    <%= best_in_place @user, :public_profile, type: :checkbox, collection: %w[No Yes] %>
  </p>
# done already in template
# .purr {
#   position: fixed;
#   top: 30px;
#   right: 100px;
#   width: 250px;
#   padding: 20px;
#   background-color: #FCC;
#   border: solid 2px #666;
#   &:first-letter { text-transform: uppercase };
# }

# trouble shooting
--rake asset:precompile
--respond_with cannot be inside a respond_to do |format| block
--make sure you are on current_user
