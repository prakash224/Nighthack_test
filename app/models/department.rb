class Department < ApplicationRecord
  validates_presence_of :name, :code
  belongs_to :college
  has_many :students, dependent: :destroy
  has_many :scores, through: :students
end
