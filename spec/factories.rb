FactoryGirl.define do

  factory :assignment do
    name { Faker::Name.first_name }
    body { Faker::Lorem.paragraph }
    course_id { Faker::Number.digit }
    teacher_id { Faker::Number.digit }
  end
  
  factory :course do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
    course_code { Faker::Lorem.word }
  end

  factory :enrollment do
    course_id { Faker::Number.digit }
    student_id { Faker::Number.digit }
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
