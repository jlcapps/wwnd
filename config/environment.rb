# Load the rails application
require File.expand_path('../application', __FILE__)
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Initialize the rails application
Wwnd::Application.initialize!
