source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'sqlite3'
gem 'mysql2'
gem 'capistrano'
gem 'cancan'
gem 'jquery-rails'
gem 'nifty-generators'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end


# Use unicorn as the web server
# gem 'unicorn'


# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :development, :test do 
  gem 'webrat'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cucumber'
  gem 'watchr'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
	gem "mocha", :group => :test
end

