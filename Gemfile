source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'jquery-rails'
gem 'bootstrap-sass'					# CSS Library
gem 'feedzirra'							# Parsing RSS Feeds
gem 'bootstrap-will_paginate'			# Pagination
gem 'rmagick'							# Image Processing
gem 'carrierwave'						# Image Uploading
gem 'fog'								# Amazon S3 Interface

group :development, :test do
	gem 'sqlite3'
	gem 'rspec-rails'					# Testing
	gem 'factory_girl_rails'			# Insert data into test DB
	gem 'capybara'						# Testing
end

group :development do
	gem 'better_errors'					# Better Error Pages
	gem 'binding_of_caller'				# Better Error Pages
	gem 'meta_request'					# For Chrome Extension
	gem 'annotate'						# Annotate Models
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
	gem 'pg'							# For Heroku
end
