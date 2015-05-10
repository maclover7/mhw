FactoryGirl.define do
  factory :course do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
    course_code { Faker::Lorem.word }
  end

  factory :student, traits: [:user]
  factory :teacher, traits: [:user]
  factory :user, traits: [:user]

  trait :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "foo#{ n }@bar.com" }
    password { Faker::Internet.password(8) }
    password_confirmation { |u| u.password }
  end

end
