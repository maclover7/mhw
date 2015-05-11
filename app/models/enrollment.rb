class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates_uniqueness_of :course_id, scope: :student
  validates_uniqueness_of :student_id, scope: :course
end
