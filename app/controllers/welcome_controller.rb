class WelcomeController < ApplicationController
  skip_before_action :require_login

  def index
    mentor = Mentor.find_by(email: self.current_user.email) if current_user
    @is_mentor = !mentor.nil?
    @is_manager_approved = @is_mentor && mentor.is_approved
    @is_admin_approved = @is_manager_approved && mentor.is_active
  end
end
