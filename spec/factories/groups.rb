FactoryGirl.define do
  factory :group do
    name { Faker::Team.name }

    trait :with_messages do
      after(:create) do |group|
        3.times { create(:message, group: group, user: user)}
      end
    end
  end
end
