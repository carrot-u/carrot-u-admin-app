class AdminsController < ApplicationController

  # GET /admins/applications
  # Show current student applications for approval
  def applications
    @course_session = CourseSession.accepting_applications.first
    @applications = CourseSessionParticipant.student.where(
      course_session: @course_session,
      application_complete: true,
      accepted_at: nil
    ).includes(:application_answers, :user)

    render "applications"
  end

  def approve_student_application
    @student_application = CourseSessionParticipant.find(params[:id])
    @student_application.update_columns(manager_approved_at: Time.now, accepted_at: Time.now)
    redirect_to admins_applications_url
  end

end
