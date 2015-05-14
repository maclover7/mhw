class CreateStudentAssignmentJob < Struct.new(:assignment_id)

  def self.enqueue(assignment_id)
    Delayed::Job.enqueue(new(assignment_id))
  end

  def perform
    assignment = Assignment.find_by_id(assignment_id)
    course = assignment.course
    students = Student.all
    #students1 = students.enrollments.where(course_id: course)
    #students1.each do |s|
    #  StudentAssignment.new(assignment_id: assignment, student_id: student)
    #end
  end
end
