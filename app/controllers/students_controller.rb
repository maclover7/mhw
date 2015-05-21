class StudentsController < ApplicationController
  before_filter :authenticate_student!

  def index
    @student = current_student
    @courses = current_student.courses
    @student_assignments = StudentAssignment.where(student_id: current_student.id).all
  end

end
