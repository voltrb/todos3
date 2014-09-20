source 'https://rubygems.org'

gem 'volt', github: 'voltrb/volt'

# The following gem's are optional for themeing

# Twitter bootstrap
gem 'volt-bootstrap'

# Simple theme for bootstrap, remove to theme yourself.
gem 'volt-bootstrap-jumbotron-theme'

# Form Fields
gem 'volt-fields'


# Server for MRI
platform :mri do
  gem 'thin', '~> 1.6.0'
  gem 'bson_ext', '~> 1.9.0'
end

# Server for jruby
platform :jruby do
  gem 'jubilee'
end

#---------------------
# Needed at the moment
gem 'volt-sockjs', require: false, platforms: :mri
