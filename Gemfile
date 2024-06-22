source 'https://rubygems.org'

gem 'rails', '7.0.4'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku, replace "gem 'sqlite3'" in your Gemfile with this:
group :test do
  gem 'activerecord-oracle_enhanced-adapter', '~> 1.4.0'
  gem 'ruby-oci8'
end
group :development, :production do
  gem 'pg' # use PostgreSQL in production (Heroku)
end

# use Haml for templates
gem 'haml'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 6.0.0'
  gem 'coffee-rails', '~> 5.0.0'
  gem 'uglifier', '>= 4.2.0'
end

gem 'jquery-rails'
gem 'devise'
gem 'tzinfo-data'
gem 'chartkick'
gem 'webrick'
gem "net-http"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
ruby '3.1.5'

gem 'dartsass-sprockets', '~> 3.1.0'
gem 'bootstrap', '~> 5.3.3'