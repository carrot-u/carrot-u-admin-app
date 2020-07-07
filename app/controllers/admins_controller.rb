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

end
