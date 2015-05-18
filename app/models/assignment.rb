class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :student_assignments
  belongs_to :teacher

  validates_presence_of :name, :body, :due_date

  private
    def create_student_assignments!
      @assignment = self
      @course = Course.find_by_id(@assignment.course_id)
      @enrollments = Enrollment.where(course_id: @course).all
      @enrollments.each do |enrollment|
        @assignment = self
        @student_id = enrollment.student_id
        @student = Student.find_by_id(@student_id)
        @sa = StudentAssignment.new(assignment_id: @assignment.id, student_id: @student.id)
        @sa.save
      end
    end

    def destroy_student_assignments!
    end
end
