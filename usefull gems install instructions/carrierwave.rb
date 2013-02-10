CarrierWave File Uploads

rails g uploader image # name the upload class, later referenced as ImageUploader
rails g migration add_image_to_paintings image:string #add image column to model
rake db:migrate

model.rb 
	mount_uploader :image, ImageUploader

<div class="field">
	<%= f.label :image, "Upload your photo" %><br />
	<%= f.file_field :image %>
</div>