class UsersManager < ApplicationRecord
  belongs_to :user
  belongs_to :manager, class_name: "User"

  scope :current, -> { where(current: true).first }
end
