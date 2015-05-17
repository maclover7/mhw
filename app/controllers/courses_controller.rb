class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_teacher!
  before_action :correct_teacher, only: [:edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @assignments = @course.assignments
    @course_links = @course.course_links
    @course_files = @course.course_files
  end

  # GET /courses/new
  def new
    @course = current_teacher.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = current_teacher.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
    end
  end

  def add_link
    @course = Course.find(params[:id])
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
    @course = Course.find(params[:id])
    @course_link = CourseLink.find(params[:link_id])

    @course_link.destroy
    flash[:alert] = "Link deleted!"
    redirect_to course_path(@course)
  end

  def add_file
    @course = Course.find(params[:id])
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
    @course = Course.find(params[:id])
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

    def correct_teacher
      @course = current_teacher.courses.find_by(id: params[:id])
      redirect_to teacher_root_path, notice: "Not authorized to edit this course" if @course.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :course_code, :teacher_id)
    end
end
