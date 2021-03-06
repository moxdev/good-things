# Start rails with postgresql
rails new "myapp" --database=postgresql

######################
# Gem File Settings
######################

source 'https://rubygems.org'

# Bootstrap SASS 3.3.5.1
gem 'bootstrap-sass', '~> 3.3.5.1'
# Bootstrap Dependency
gem 'autoprefixer-rails', '~> 6.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # To enable features such as static asset serving and logging on Heroku
  gem 'rails_12factor', group: :production

  # Watches files fro changes and refreshes browser
  gem "guard", ">= 2.2.2", :require => false
  gem "guard-livereload",  :require => false
  gem "rack-livereload"
  gem "rb-fsevent",        :require => false
end

ruby "2.2.0"

##################################
# Development.rb
################################

# Automatically inject JavaScript needed for LiveReload
config.middleware.insert_after(ActionDispatch::Static, Rack::LiveReload)

################################
# Guard file
################################

# First run to create Guard file
guard init livereload

#Then add this to Guard file
guard :livereload do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
  watch(%r{(app|vendor)(/assets/\w+/(.+)\.(scss))}) { |m| "/assets/#{m[3]}.css" }
end

################################
# Bootstrap Imports & JS
################################

# Imports for bootstrap and variables add to main css file (application.css.sass)
@import "variables" # create this file for sass variables
@import "bootstrap-sprockets"
@import "bootstrap"

###############
# Add to aplplication.js (right above //= require_tree . )
//= require bootstrap-sprockets
################################

###############################
# Activate Guard livereload
###############################
# start rails server then run:
guard -P livereload
# Then open localhost

###############################
#
###############################

###############################
#
###############################

###############################
#
###############################