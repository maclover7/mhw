class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_teacher!
  before_action :correct_teacher, only: [:edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.where(teacher_id: current_teacher).all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = current_teacher.assignments.build #Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = current_teacher.assignments.build(assignment_params) #Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        @assignment.delay.create_student_assignments!
        format.html { redirect_to course_path(@assignment.course_id), notice: 'Assignment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to course_path(@assignment.course_id), notice: 'Assignment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy_student_assignments!
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def correct_teacher
      @assignment = current_teacher.assignments.find_by(id: params[:id])
      redirect_to teacher_root_path, notice: "Not authorized to edit this assignment" if @assignment.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:name, :body, :category, :course_id, :due_date, :teacher_id)
    end
end
