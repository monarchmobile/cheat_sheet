puts "starting generation for #{app_name}"

run "rm public/index.html"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"

puts
say_status  "Rubygems", "Adding Rubygems into Gemfile...\n", :yellow
puts 

# before adding project to the repo, we remove sensitive data. e.g. the secret token
gsub_file 'config/initializers/secret_token.rb', /secret_token *= *'.+'/, "secret_token = ENV['APP_SECRET_TOKEN']"

# add secret token in ignored application.yml file.
append_to_file 'config/application.yml', "APP_SECRET_TOKEN: #{SecureRandom.hex(64)}"

gem_group :assets do
  gem "ember-rails", git: 'git://github.com/emberjs/ember-rails.git'
end

generate 'figaro:install'

file 'spec/support/vcr.rb', <<-CODE
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.ignore_localhost = true
end
CODE

generate :scaffold, "Article title:string content:text published:boolean --orm=redis_persistence"
route "root :to => 'articles#index'"

remove_file 'db/seeds.rb'
file        'db/seeds.rb', <<-CODE
Redis::Persistence.config.redis.flushdb

contents = [
'Lorem ipsum dolor sit amet.',
'Consectetur adipisicing elit, sed do eiusmod tempor incididunt.',
'Labore et dolore magna aliqua.',
'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
'Excepteur sint occaecat cupidatat non proident.'
]

puts "Creating articles..."
%w[ One Two Three Four Five ].each_with_index do |title, i|
  Article.create title: title, content: contents[i], published: (rand > 0.5 ? true : false)
end
CODE

rake "db:seed"

run  "rails server"