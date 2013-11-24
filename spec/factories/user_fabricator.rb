FactoryGirl.define do
  factory :user do
    user_id { |i| "id #{i}" }
  end
end