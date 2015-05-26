class StudentsController < ApplicationController
  before_filter :authenticate_student!

  def index
    @student = current_student
    @courses = current_student.courses

    ## Per Time Period:
    if params[:time] == "overdue"
      @page_heading = "Overdue Assignments:"
      @student_assignments = StudentAssignment.where(completed: false).joins(:assignment).where("assignments.due_date <= ?", Date.today).all && StudentAssignment.where(completed: nil).joins(:assignment).where("assignments.due_date <= ?", Date.today).all
    elsif params[:time] == "today"
      @page_heading = "Today's Assignments:"
      @student_assignments = StudentAssignment.joins(:assignment).where("DATE(assignments.due_date) = ?", Date.today).all
    elsif params[:time] == "tomorrow"
      @page_heading = "Tomorrow's Assignments:"
      @student_assignments = StudentAssignment.joins(:assignment).where("DATE(assignments.due_date) = ?", Date.tomorrow).all
    elsif params[:time] == "week"
      @page_heading = "This Week's Assignments:"
      @student_assignments = StudentAssignment.joins(:assignment).where("DATE(assignments.due_date) BETWEEN ? AND ?", Date.today.beginning_of_week, Date.today.end_of_week).all
    elsif params[:time] == "next_2_weeks"
      @page_heading = "Next 2 Week's Assignments"
      @student_assignments = StudentAssignment.joins(:assignment).where("DATE(assignments.due_date) BETWEEN ? AND ?", Date.today.beginning_of_week, Date.today.end_of_week + 7.days).all
    elsif params[:time] == "all"
      @page_heading = "All Assignments:"
      @student_assignments = StudentAssignment.where(student_id: current_student.id, completed: false).all && StudentAssignment.where(student_id: current_student.id, completed: nil).all
    end

    ## Per Course:
    if params[:course_id]
      if @course = current_student.courses.find_by_id(params[:course_id])
        @page_heading = "#{@course.name} Assignments:"
        @student_assignments = StudentAssignment.where(completed: false).joins(:assignment).where("assignments.course_id = ?", @course.id).all && StudentAssignment.where(completed: nil).joins(:assignment).where("assignments.course_id = ?", @course.id).all
      else
        redirect_to student_root_path, notice: "Not authorized to view assignments for this course" if @course.nil?
      end
    end

    ## Count Info:
    @overdue_assignments = StudentAssignment.where(completed: false).joins(:assignment).where("assignments.due_date <= ?", Date.today).all && StudentAssignment.where(completed: nil).joins(:assignment).where("assignments.due_date <= ?", Date.today).all
    @today_assignments = StudentAssignment.where(completed: false).joins(:assignment).where("DATE(assignments.due_date) = ?", Date.today).all && StudentAssignment.where(completed: nil).joins(:assignment).where("DATE(assignments.due_date) = ?", Date.today).all
    @tomorrow_assignments = StudentAssignment.where(completed: false).joins(:assignment).where("DATE(assignments.due_date) = ?", Date.tomorrow).all && StudentAssignment.where(completed: nil).joins(:assignment).where("DATE(assignments.due_date) = ?", Date.tomorrow).all
    @week_assignments = StudentAssignment.where(completed: false).joins(:assignment).where("DATE(assignments.due_date) BETWEEN ? AND ?", Date.today.beginning_of_week, Date.today.end_of_week).all && StudentAssignment.where(completed: nil).joins(:assignment).where("DATE(assignments.due_date) BETWEEN ? AND ?", Date.today.beginning_of_week, Date.today.end_of_week).all
    @next_2_weeks_assignments = StudentAssignment.where(completed: false).joins(:assignment).where("DATE(assignments.due_date) BETWEEN ? AND ?", Date.today.beginning_of_week, Date.today.end_of_week + 7.days).all && StudentAssignment.where(completed: nil).joins(:assignment).where("DATE(assignments.due_date) BETWEEN ? AND ?", Date.today.beginning_of_week, Date.today.end_of_week + 7.days).all
    @all_assignments = StudentAssignment.where(student_id: current_student.id, completed: false).all && StudentAssignment.where(student_id: current_student.id, completed: nil).all
  end

end
