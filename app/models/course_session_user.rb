class CourseSessionUser < ApplicationRecord
    has_many :homework_submissions
end
