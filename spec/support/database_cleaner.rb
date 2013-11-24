require 'database_cleaner'

RSpec.configure do |conf|

  conf.before :suite do
    DatabaseCleaner[:mongoid].strategy       = :truncation
  end

  conf.before :each do
    DatabaseCleaner.start
  end

  conf.after :each do
    DatabaseCleaner.clean
  end

end
