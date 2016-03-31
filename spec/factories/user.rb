FactoryGirl.define do
  factory :user do
    password 'ev3r45b56by5'
    sequence(:email) { |n| "adamadam#{n}@qwe123.com" }

      factory :user_with_groups do
        transient do
          groups_count 5
        end
        
        after(:create) do |user, evaluator|
          create_list(:group, evaluator.groups_count, :users => [user])
        end          
      end
    end
end