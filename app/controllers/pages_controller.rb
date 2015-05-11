class PagesController < ApplicationController

  def dashboard_student
    @student = current_student
  end

  def dashboard_teacher
    @teacher = current_teacher
    @courses = Course.where(teacher_id: current_teacher).all #current_teacher.courses
  end

  def home
    @user = current_student if student_signed_in?
    @user = current_teacher if teacher_signed_in?
  end

  def auth
  end
end
