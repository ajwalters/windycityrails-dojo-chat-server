source 'http://rubygems.org'

gem 'rails', '3.0.0'
gem 'redis', '2.0.5'
platform :ruby_18 do
  gem "SystemTimer"
  gem "ruby-debug"
end
platform :ruby_19 do
  gem "ruby-debug19"
end
gem "thin"

group :test, :development do
  gem "rspec-rails", ">= 2.0.0.beta.20"
  gem "webrat", "0.7.1"
  gem "wirble"
end

group :bot do
  gem "httparty"
end

#uncomment for twitter bot...weird
#group :twitter_bot do 
#  gem "tweetstream"
#  gem "json"
#end
