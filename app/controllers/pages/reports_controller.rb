class Pages::ReportsController < ApplicationController
    def index
        @colleges = College.all
        @departments = Department.all
        @students = Student.all
    end
    def create
        if !params[:college_id].empty? && params[:department_id].empty? && params[:student_id].empty?
            @college = College.find(params[:college_id])
            @departments = @college.departments
            @students = @college.students
            @avg_scores =[]
            @students.each do |student|
                @avg_scores << student.scores.average(:score).to_f
            end
            if @avg_scores.empty?
                @overall_avg_score = 0
            else
                @overall_avg_score = (@avg_scores.sum / @avg_scores.size).to_f
            end
        elsif !params[:department_id].empty? && params[:college_id].empty? && params[:student_id].empty?
            @department = Department.find(params[:department_id])
            @students = @department.students
            @avg_scores =[]
            @students.each do |student|
                @avg_scores << student.scores.average(:score).to_f
            end
            if @avg_scores.empty?
                @overall_avg_score = 0
            else
                @overall_avg_score = (@avg_scores.sum / @avg_scores.size).to_f
            end
        elsif !params[:college_id].empty? && !params[:student_id].empty? && params[:department_id].empty?
            @college = College.find(params[:college_id])
            @departments = @college.departments
            @student = Student.find(params[:student_id])
            @students = @college.students.where(:id => params[:student_id])
            @avg_scores =[]
            @students.each do |student|
                @avg_scores << student.scores.average(:score).to_f
            end
            if @avg_scores.empty?
                @overall_avg_score = 0
            else
                @overall_avg_score = (@avg_scores.sum / @avg_scores.size).to_f
            end
        elsif !params[:department_id].empty? && !params[:student_id].empty? && params[:college_id].empty?
            @department = Department.find(params[:department_id])
            @students = @department.students.where(:id => params[:student_id])
            @avg_scores =[]
            @students.each do |student|
                @avg_scores << student.scores.average(:score).to_f
            end
            if @avg_scores.empty?
                @overall_avg_score = 0
            else
                @overall_avg_score = (@avg_scores.sum / @avg_scores.size).to_f
            end
        elsif !params[:college_id].empty? && !params[:department_id].empty? && !params[:student_id].empty?
            @college = College.find(params[:college_id])
            @department = Department.find(params[:department_id])
            @student = Student.find(params[:student_id])
            @students = @college.students.where(:id => params[:student_id], :department_id => params[:department_id])
            @avg_scores =[]
            @students.each do |student|
                @avg_scores << student.scores.average(:score).to_f
            end
            if @avg_scores.empty?
                @overall_avg_score = 0
            else
                @overall_avg_score = (@avg_scores.sum / @avg_scores.size).to_f
            end
        else
            @student = Student.find(params[:student_id])
            @avg_score = @student.scores.average(:score).to_f
            @overall_avg_score = @avg_score
        end
    end
end
