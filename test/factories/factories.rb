require 'faker'

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password {Faker::Internet.password}
  end

  factory :exercise do
    name Faker::Lorem.word
    description Faker::Lorem.sentence(3)
  end

  factory :drill do
    run
  end

  factory :run do
    exercise
    sets 1
    factory :run_with_drills do
      id 1
      after(:create) do |run|
        create_list(:drill, 2, run: run )
      end
    end
  end
end
