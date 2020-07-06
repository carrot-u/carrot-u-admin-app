class CourseSessionParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :course_session
  has_many :application_answers
  has_many :homework_submissions

  module Roles
    STUDENT = :student
    MENTOR = :mentor
    ADMINISTRATOR = :administrator
    LECTURER = :lecturer
  end

  scope :student, -> { where(role: Roles::STUDENT) }

  def pending?
    !self.new_record? && self.application_complete && (pending_manager_approval? || pending_acceptance?)
  end

  def pending_manager_approval?
    self.manager_approved_at.nil?
  end

  def pending_acceptance?
    self.accepted_at.nil?
  end
end
