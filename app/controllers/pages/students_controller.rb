class Pages::StudentsController < ApplicationController
    def index
      @students = Student.all
    end
    def create
      n = params["number"].to_i
      n.times do
        @student = Student.new
        @student.name = Faker::Name.name
        @student.registration_number = Faker::Number.number(digits: 4)
        @student.gender = Faker::Gender.binary_type
        @student.dob = Faker::Date.forward(days: 23)
        @student.year_of_registration = Faker::Date.forward(days: 20).year
        @student.batch = Faker::Number.number(digits: 2)
        @student.department_id = params["department_id"]
        college = College.find(Department.find(params[:department_id])[:college_id])
        
        @student.save
      end
      redirect_to pages_students_path(@student)
    end
end
