class HomeworkSubmission < ApplicationRecord
  belongs_to :course_session_participant
  belongs_to :homework
end
