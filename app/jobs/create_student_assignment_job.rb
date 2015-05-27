class CreateStudentAssignmentJob < Struct.new(:assignment_id)

  def self.enqueue(assignment_id)
    Delayed::Job.enqueue(new(assignment_id))
  end

  def perform
    assignment = Assignment.find_by_id(assignment_id)
    course = assignment.course

    course.enrollments.each do |enrollment|
      student = enrollment.student
      student.give_assigment(assignment)
    end
  end
end
