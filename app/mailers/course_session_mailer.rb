class CourseSessionMailer < ApplicationMailer
  def session_open_email
    @course_session = params[:course_session]

    mail(to: params[:user].email, subject: "Sign up for Carrot U")
  end
end
