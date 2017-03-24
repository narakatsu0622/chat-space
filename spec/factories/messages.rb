FactoryGirl.define do
  factory :message do
    body       { Faker::Lorem.sentence }
    image      ""
    group_id   { Faker::Number.number(10)}
    user_id    { Faker::Number.number(10)}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end

