class StudentsController < ApplicationController

  def index
    @student = current_student
    @courses = current_student.courses
  end
end
