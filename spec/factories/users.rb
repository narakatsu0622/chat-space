FactoryGirl.define do
  factory :user do
    name      { Faker::Name.name }
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }

    after(:create) do |user|
      3.times { create(:group, users:[user]) }
    end
  end
end
