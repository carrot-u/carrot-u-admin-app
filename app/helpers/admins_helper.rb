module AdminsHelper
  def student_application_question(question_key)
    ApplicationAnswer::STUDENT_APPLICATION_QUESTIONS[question_key.to_sym] || question_key.capitalize.split('_').join(' ')
  end
end
