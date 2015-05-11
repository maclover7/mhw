class PagesController < ApplicationController

  def dashboard_student
    @student = current_student
    @courses = current_student.courses
  end

  def dashboard_teacher
    @teacher = current_teacher
    @courses = current_teacher.courses #Course.where(teacher_id: current_teacher).all
  end

  def home
    @user = current_student if student_signed_in?
    @user = current_teacher if teacher_signed_in?
  end

  def auth
  end
end
