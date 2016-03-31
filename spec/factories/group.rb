FactoryGirl.define do
  factory :group do
    sequence(:group_name) { |n| "group#{n}" }

    factory :group_with_users do
      transient do
        users_count 5
      end
      
      after(:create) do |group, evaluator|
        create_list(:user, evaluator.users_count, :groups => [group])
      end
    end
  end
  
end