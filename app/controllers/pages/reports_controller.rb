class Pages::ReportsController < ApplicationController
    def index
        @colleges = College.all
        @departments = Department.all
        @students = Student.all
    end
    def create
        if !params[:college_id].empty?
            @college = College.find(params[:college_id])
            @departments = @college.departments
            @students = @college.students
            @avg_scores =[]
            @students.each do |student|
                @avg_scores << student.scores.average(:score).to_f
            end
            @overall_avg_score = (@avg_scores.sum / @avg_scores.size).to_f
        elsif !params[:department_id].empty?
            @department = Department.find(params[:department_id])
            @students = @department.students
            @avg_scores =[]
            @students.each do |student|
                @avg_scores << student.scores.average(:score).to_f
            end
            @overall_avg_score = (@avg_scores.sum / @avg_scores.size).to_f
        else
            @student = Student.find(params[:student_id])
            @avg_score = @student.scores.average(:score).to_f
            @overall_avg_score = @avg_score
        end
    end
end
