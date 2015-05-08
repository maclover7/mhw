FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.name { Faker::Name.name }
    f.password { Faker::Internet.password(8) }
  end

end
