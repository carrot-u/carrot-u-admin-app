class ApplicationAnswer < ApplicationRecord
  belongs_to :course_session_participant

  STUDENT_APPLICATION_QUESTIONS = {
    department: "Department",
    start_date: "Start date",
    code_sample: "Code sample",
    project: "Project description",
    why_carrot_u: "Why join Carrot U?",
    goal: "Study goal"
  }
end
