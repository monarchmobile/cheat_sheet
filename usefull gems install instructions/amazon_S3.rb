# add gem to gemfile 
gem 'fog'

# create new file in initializers
carrierwave.rb

# railscasts episodes
"http://railscasts.com/episodes/383-uploading-to-amazon-s3?autoplay=true"

1) 
https://portal.aws.amazon.com/gp/aws/securityCredentials
grab secret access key
jq305CxP8jGBVfu0oQ9gTtynEXu26nDZfkUmdjmL

2) myaccount/console
	aws mngt console
		S3

	create buckets for dev, staging and production
3)
# initializers/carrierwave.rb
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
  }
  config.fog_directory = ENV["AWS_S3_BUCKET"]
end

4)
# application.yml
# AWS 
do for each app version(dev/prod/staging)
AWS_ACCESS_KEY_ID: "AKIAI2RBWCHGQILXRHUQ"
AWS_SECRET_ACCESS_KEY: "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"
AWS_S3_BUCKET: "app_name-development"

5) change image_uploader.rb 
storage: fog

include CarrierWave::MimeTypes
process :set_content_type

6) restart server