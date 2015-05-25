class StudentAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student

  def assignment_course_id
    #self.assignment.course.id
    assignment.course.id
  end

  def assignment_due_date
    #self.assignment.due_date
    assignment.due_date.strftime("%A, %B %d")
  end

end
