class Student < User
  has_many :student_assignments
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments

  def give_assignment(assignment)
    StudentAssignment.create(student: self, assignment: assignment)
  end
end
