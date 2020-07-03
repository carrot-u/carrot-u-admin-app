class StudentsController < ApplicationController
  before_action :set_open_course_session, only: [:apply, :application]
  before_action :set_student, only: [:application]

=begin
  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:user_id)
    end
=end

  # GET /students/apply
  # Allow a student to apply for the upcoming course session, if there is one
  def apply
    if @course_session.nil?
      @waiting_list = WaitingList.current.where(user: current_user).first
    else
      set_student
    end

    render :apply
  end

  # POST /students/application
  # Save the manager info and application answers for a student
  def application
    # Record the manager email
    manager = User.find_or_create_by(email: application_params[:manager_email])
    UsersManager.current.find_or_create_by(user: current_user, manager: manager)

    @student.save!
    # TODO @muffy - save application answers
    render :apply
  end

  # POST /students/waitlist
  # Add a student to the waiting list for the next available course session
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

  private

  # Only allow a list of trusted parameters through.
  def application_params
    params.permit(:manager_email)
  end

  def set_open_course_session
    @course_session = CourseSession.accepting_applications.first
  end

  def set_student
    @student = CourseSessionParticipant.student.find_or_initialize_by(user: current_user, course_session: @course_session)
  end
end
