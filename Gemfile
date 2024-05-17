source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.1'

gem "rails", "~> 7.1.3", ">= 7.1.3.3"
gem 'sqlite3', '~> 1.6'
gem 'puma', '~> 6.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jsbundling-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 6.1.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'guard', '~> 2.18.0', group: :development
  gem 'guard-rspec', '~> 4.7.3', group: :development, require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
