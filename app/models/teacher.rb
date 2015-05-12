class Teacher < User
  has_many :assignments
  has_many :courses
end
