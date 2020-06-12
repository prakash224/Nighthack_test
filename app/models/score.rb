class Score < ApplicationRecord
  validates_presence_of :subject, :score
  belongs_to :student
  belongs_to :department, optional: true
  belongs_to :college, optional: true
end
