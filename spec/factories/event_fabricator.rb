FactoryGirl.define do
  factory :event do
    event_id { |i| "id #{i}" }
  end
end