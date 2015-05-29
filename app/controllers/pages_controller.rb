class PagesController < ApplicationController

  # GET /
  def home
    @user = current_student if student_signed_in?
    @user = current_teacher if teacher_signed_in?
  end

  # GET /auth
  def auth
  end

  # GET /help
  def help
  end
end
