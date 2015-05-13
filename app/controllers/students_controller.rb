class StudentsController < ApplicationController
  before_filter :authenticate_student!

  def index
    @student = current_student
    @courses = current_student.courses
    @assignments = Assignment.where(course_id: @courses).all #current_student.courses.assignments
  end

  def add_course
    @student = Student.find(params[:id])
    course_code = params[:course][:course_code]
    course = Course.where(course_code: course_code).first
    if course.nil?
      flash[:alert] = "No courses were found with the specified course code."
    elsif @student.courses.include?(course)
      flash[:alert] = "The specified course is already added."
    else
      @student.courses << course
    end
    redirect_to student_root_path
  end

  def leave_course
    @student = Student.find(params[:id])

    if @student.nil? or params[:course_id].nil? or Course.find(params[:course_id]).nil?
      #flash[:alert] = "An error occured while trying to delete the course."
    else
      @course = Course.find(params[:course_id])
      @student.courses.delete(@course)
    end
    redirect_to student_root_path
  end
end
