ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# XXX -- this should set up functional testing with TS, but using TS in tests
# currently causes mysqld to soak up all the CPU when the Sphinx indexer is
# running. So I will stub out the search until this can be resolved.
#
# require 'thinking_sphinx/test'
# ThinkingSphinx::Test.init

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
