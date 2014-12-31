source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'pg', '~> 0.17'

gem 'sass-rails', '~> 4.0'
gem 'uglifier', '~> 2.3.3'
gem 'coffee-rails', '~> 4.1'
gem 'jbuilder', '~> 2.0.8'
gem 'haml', '~> 4.0'
gem 'jquery-rails', '~> 2.0'

gem 'angularjs-rails', '~> 1.2.26'
gem 'anjlab-bootstrap-rails', '~> 3.0.3', require: 'bootstrap-rails'
gem 'font-awesome-sass', '~> 4.0.3'
gem 'ngmin-rails', '~> 0.4.0'
gem 'haml_coffee_assets', git: 'https://github.com/netzpirat/haml_coffee_assets'
gem 'execjs', '~> 2.0.2'
gem 'redcarpet', '~> 3.2'

# Third Party Integration Gems
gem 'fitgem', '~> 0.10'
gem 'meetup_client', github: 'codebender/meetup_client', branch: 'rails-4-2'

# rails 4.2 gems
gem 'responders', '~> 2.0'

group :development, :test do
  gem 'rspec-rails', '~> 3.1'
  gem 'dotenv-rails', '~> 0.11'
  gem 'codeclimate-test-reporter', require: false
  gem 'awesome_print'
end

group :development do
  gem 'quiet_assets', '~> 1.0.3'
  gem 'thin-rails'
end

group :production do
  gem 'unicorn', '~> 4.8'
  gem 'rails_12factor'
end
