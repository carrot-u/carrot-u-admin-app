class StudentsController < ApplicationController
=begin
  # TODO @muffy - may not use any of this, keeping it for reference for now
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/1/edit
  def edit
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Waiting list was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Waiting list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:user_id)
    end
=end

  # GET /students/apply
  # Allow a student to apply for the upcoming course session, if there is one
  def apply
    @course_session = CourseSession.accepting_applications.first
    if @course_session.nil?
      @waiting_list = WaitingList.current.where(user: current_user).first
    end

    render :apply
  end

  # POST /students/waitlist
  # Add a student to the waiting list for the next available scourse
  def waitlist
    # ensure the student isn't already on the waiting list
    @waiting_list = WaitingList.find_or_create_by(user: current_user, course_session: nil)

    if @waiting_list.new_record? && !@waiting_list.save!
      @notice = "There was an error adding you to the waiting list, please try again later."
    end

    render :apply
  end

  # GET /students/waiting_list
  # Show the current waiting list, admins only
  def waiting_list
    if admin?
      @waiting_list = WaitingList.current
    else
      @waiting_list = []
      @notice = "You must be an admin to view the waiting list."
    end
  end
end
