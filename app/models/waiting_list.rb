class WaitingList < ApplicationRecord
  belongs_to :user
  belongs_to :course_session, optional: true

  scope :current, -> { where(course_session: nil).includes(:user) }

  class << self
    def notify_course_session_open(course_session)
      current.each do |waiting_list|
        CourseSessionMailer.with(course_session: course_session, user: waiting_list.user).session_open_email.deliver_later
        waiting_list.update(course_session: course_session)
      end
    end
  end
end
