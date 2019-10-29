# require 'webmock/test'
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/test/'
  add_filter '/app/channels/'
  add_filter '/app/jobs/'
  add_filter '/app/mailers/'
end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers


  end
