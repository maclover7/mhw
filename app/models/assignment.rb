class Assignment < ActiveRecord::Base
  after_create :create_student_assignments

  belongs_to :course
  belongs_to :teacher
  has_many :student_assignments

  validates_presence_of :name, :body, :due_date

  private

    def create_student_assignments
      CreateStudentAssignmentJob.enqueue(self.id)
    end
end
