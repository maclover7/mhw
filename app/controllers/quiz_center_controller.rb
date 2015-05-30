class QuizCenterController < ApplicationController
  before_action :set_assignment
  before_action :authenticate_student!
  before_action :assignment_active

  def take
    @student_assignment = StudentAssignment.where(assignment_id: @assignment.id, student_id: current_student.id)
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_active
      if @course = current_student.courses.find_by(id: @assignment.course_id)
        if @assignment.active?
        else
          redirect_to quiz_center_path, notice: "Not authorized to take this assignment"
        end
      else
        redirect_to quiz_center_path, notice: "Not authorized to take this assignment"
      end
    end
end
