class ApplicationQuestion < ApplicationRecord
  validates_presence_of :text, :role
  validates :text, uniqueness: true
end
