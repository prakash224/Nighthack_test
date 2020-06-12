class College < ApplicationRecord
    validates_uniqueness_of :name
    validates_presence_of :name, :code
    has_many :departments, dependent: :destroy
    has_many :students, through: :departments
    has_many :scores, through: :students
end
