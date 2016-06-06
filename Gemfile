source 'https://rubygems.org'

gem 'rails', '3.2.14'

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
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'devise'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
ruby '1.9.3'
