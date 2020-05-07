class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :require_login

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def require_login
    return if logged_in?

    session[:previous_url] = request.fullpath if request.format.html?
    redirect_to root_path
  end
end
