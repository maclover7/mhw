class StudentsController < ApplicationController
  before_filter :authenticate_student!

  def index
    @student = current_student
    @courses = current_student.courses

    ## Per Time Period:
    if params[:time] == "overdue"
    elsif params[:time] == "today"
      @page_heading = "Today's Assignments:"
      @today = Date.today.strftime("%A, %B %d")
      #@student_assignments = StudentAssignment.where(id: "25", assignment_due_date: @today).all#where(student_id: current_student.id).all

      #@sa.each do |sa|
      #  if sa.assignment_due_date == @today
      #    @student_assignments == sa
      #  end
      #end

#        @sa1.each do |sa1|
#          @date = sa1.assignment.due_date.strftime("%A, %B %d")
#          if @date == Date.today.strftime("%A, %B %d")
#            @student_assignments == sa1
#          end
#        end
    elsif params[:time] == "tomorrow"
    elsif params[:time] == "week"
    elsif params[:time] == "next_2_weeks"
    elsif params[:time] == "all"
      @student_assignments = StudentAssignment.where(student_id: current_student.id).all
      @page_heading = "All Assignments:"
    end

    ## Per Course:
    if params[:course_id]
      if @course = current_student.courses.find_by_id(params[:course_id])
        @page_heading = "#{@course.name} Assignments"
        @student_assignments = StudentAssignment.where(student_id: current_student.id).all #, assignment_course_id: @course.id).all
      else
        redirect_to student_root_path, notice: "Not authorized to view assignments for this course" if @course.nil?
      end
    end

    ## Count Info:
    @today = Date.today.strftime("%A, %B %d")
    @today_assignments = StudentAssignment.where(student_id: current_student.id).all #, assignment_due_date: @today).all
    @all_assignments = StudentAssignment.where(student_id: current_student.id).all
  end

end
