class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :student, :course_session, :current_student?, :admin?
  before_action :require_login

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def student
    @student ||= CourseSessionParticipant.student.find_or_initialize_by(user: current_user, course_session: course_session)
  end

  def current_student?
    !course_session.new_record? && !student.new_record?
  end

  def course_session
    @course_session ||=
      if params[:course_session_id].nil?
        CourseSession.active.last || CourseSession.new
      else
        CourseSession.find(params[:course_session_id])
      end
  end

  def admin?
    logged_in? && current_user.admin
  end

  private

  def require_login
    return if logged_in?

    session[:previous_url] = request.fullpath if request.format.html?
    redirect_to root_path
  end
end
