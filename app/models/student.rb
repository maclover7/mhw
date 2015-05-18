class Student < User
  has_many :student_assignments
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments
end
