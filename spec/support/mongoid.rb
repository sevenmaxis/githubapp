require 'mongoid-rspec'

RSpec.configure do |config|
  config.include Mongoid::Matchers, orm: :mongoid
end
