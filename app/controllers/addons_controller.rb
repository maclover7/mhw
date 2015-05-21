class AddonsController < ApplicationController
  before_action :set_course
  before_action :authenticate_teacher!

  def add_link
    name = params[:course_link][:name]
    url = params[:course_link][:url]
    @course_link = CourseLink.new(name: name, url: url, course_id: @course.id)
    if @course_link.save
      flash[:alert] = "Link saved!"
      redirect_to teacher_root_path
    else
      flash[:alert] = "The link did not save properly."
    end
  end

  def delete_link
    @course_link = CourseLink.find(params[:link_id])

    @course_link.destroy
    flash[:alert] = "Link deleted!"
    redirect_to course_path(@course)
  end

  def add_file
    name = params[:course_file][:name]
    file = params[:course_file][:file]
    @course_file = CourseFile.new(file: file, name: name, course_id: @course.id)
    if @course_file.save
      flash[:alert] = "File saved!"
      redirect_to course_path(@course)
    else
      flash[:alert] = "The file did not save properly."
      redirect_to teacher_root_path
    end
  end

  def delete_file
    @course_file = CourseFile.find(params[:file_id])

    @course_file.destroy
    flash[:alert] = "File deleted!"
    redirect_to course_path(@course)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
end
