class PagesController < ApplicationController

  def home
    @user = current_student if student_signed_in?
    @user = current_teacher if teacher_signed_in?
  end

  def sign_up_selection
  end
end
