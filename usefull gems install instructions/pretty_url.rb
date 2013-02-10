RAILSCAST 314 Pretty URLs with FriendlyId
#place this in the model to make friendly

extend FriendlyId
friendly_id :name # pretty column

# use this for urls with muliple words
extend FriendlyId
friendly_id :name, use: :slugged
rails g migration add_slug_to_articles slug:string