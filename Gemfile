source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'jquery-rails'
gem 'bootstrap-sass'					# CSS library
gem 'feedzirra'							# Parsing RSS feeds
gem 'will_paginate'						# Pagination
gem 'rmagick'							# Image processing
gem 'carrierwave'						# Image uploading
gem 'fog'								# Amazon S3 interface
gem 'fastimage'							# Get image sizes

group :development, :test do
	gem 'sqlite3'
	gem 'rspec-rails'					# Testing
	gem 'factory_girl_rails'			# Insert data into test DB
	gem 'capybara'						# Testing
end

group :development do
	gem 'better_errors'					# Better error pages
	gem 'binding_of_caller'				# Better error pages
	gem 'meta_request'					# For RailsPanel
	gem 'annotate'						# Annotate models
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
	gem 'pg'							# For Heroku
end
