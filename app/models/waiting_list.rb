class WaitingList < ApplicationRecord
  belongs_to :user
  belongs_to :course_session, optional: true

  scope :current, -> { where(course_session: nil) }
end
