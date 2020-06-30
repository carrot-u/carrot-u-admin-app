class ApplicationAnswer < ApplicationRecord
  belongs_to :application_question
  belongs_to :session_participant
  belongs_to :student
end
