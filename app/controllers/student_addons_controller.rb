class StudentAddonsController < ApplicationController
  before_filter :authenticate_student!
  before_action :assignment_student, only: [:complete_assignment, :uncomplete_assignment]

  # POST /students/1/add_course
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

  # DELETE /students/1/leave_course/1
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

  # PATCH /student_assignments/1/complete
  def complete_assignment
    @student_assignment = StudentAssignment.find(params[:id])
    @student_assignment.completed = true
    @student_assignment.save
    respond_to do |format|
      format.html { redirect_to student_root_path }
      format.js
    end
  end

  # PATCH /student_assignments/1/uncomplete
  def uncomplete_assignment
    @student_assignment = StudentAssignment.find(params[:id])
    @student_assignment.completed = false
    @student_assignment.save
    respond_to do |format|
      format.html { redirect_to student_root_path }
      format.js
    end
  end

  private

  def assignment_student
    @student_assignment = current_student.student_assignments.find_by(id: params[:id])
    redirect_to student_root_path, notice: "Not authorized to edit this assignment" if @student_assignment.nil?
  end
end
