require 'rspec'
require 'rack/test'
require 'pry'
require 'factory_girl'

ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join("..", "setup.rb"), File.dirname(__FILE__))

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.treat_symbols_as_metadata_keys_with_true_values = true
  conf.include FactoryGirl::Syntax::Methods
end

Dir[File.expand_path(File.join("spec/support", "**", "*.rb"))].each {|f| require f}

Dir[File.dirname(__FILE__)+"/factories/*.rb"].each {|file| require file }
