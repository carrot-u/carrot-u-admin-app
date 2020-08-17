class CourseSessionMailer < ApplicationMailer
  def session_open_email
    @course_session = params[:course_session]

    mail(to: params[:user].email, subject: "The new session of Carrot U is open for applications")
  end
end
