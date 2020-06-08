class Lecture < ApplicationRecord
  belongs_to :course_session
  has_one :homework
end
