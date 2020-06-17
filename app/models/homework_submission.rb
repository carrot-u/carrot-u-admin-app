class HomeworkSubmission < ApplicationRecord
  belongs_to :course_session_user
  belongs_to :homework
end
