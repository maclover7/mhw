class TeachersController < ApplicationController
  before_filter :authenticate_teacher!

  # GET /
  def index
    @teacher = current_teacher
    @courses = current_teacher.courses #Course.where(teacher_id: current_teacher).all
  end

  # GET /quiz_center
  def quiz_center
  end
end
