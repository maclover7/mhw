class StudentsController < ApplicationController
  before_filter :authenticate_student!

  def index
    @student = current_student
    @courses = current_student.courses
    @all_assignments = StudentAssignment.where(student_id: current_student.id).all
    if params[:time] == "overdue"
    elsif params[:time] == "today"
    elsif params[:time] == "tomorrow"
    elsif params[:time] == "week"
    elsif params[:time] == "next_2_weeks"
    elsif params[:time] == "all"
      @student_assignments = StudentAssignment.where(student_id: current_student.id).all
      @page_heading = "All Assignments:"
    end
  end

end
