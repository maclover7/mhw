FactoryGirl.define do

  factory :assignment do
    name { Faker::Name.first_name }
    body { Faker::Lorem.paragraph }
    due_date { Faker::Time.forward(23, :morning) }
    course_id { Faker::Number.digit }
    teacher_id { Faker::Number.digit }
    category "Quiz"
  end

  factory :course do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
    course_code { Faker::Lorem.word }
  end

  factory :course_file do
    course_id { Faker::Number.digit }
    name { Faker::Name.first_name }
  end

  factory :course_link do
    course_id { Faker::Number.digit }
    name { Faker::Name.first_name }
    url { Faker::Internet.url }
  end

  factory :enrollment do
    course_id { Faker::Number.digit }
    student_id { Faker::Number.digit }
  end

  factory :student_assignment do
    assignment_id { Faker::Number.digit }
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
