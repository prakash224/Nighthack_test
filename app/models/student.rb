class Student < ApplicationRecord
  validates_presence_of :name, :registration_number, :gender, :dob, :year_of_registration, :batch
  belongs_to :college, optional: true
  belongs_to :department
  has_many :scores, dependent: :destroy
end
