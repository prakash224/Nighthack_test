class Pages::ScoresController < ApplicationController
    def index
        @scores = Score.all
    end
    
    def create
        n = params["number"].to_i
        subjects = ["Maths", "Physics", "Social", "English", "Hindi"]
        1.upto(n) do |i| 
            subjects.each do |subject|
                @score = Score.new
                @score.subject = subject
                @score.score = Faker::Number.between(from: 30, to: 100)
                @score.student_id = i
                @score.save
            end     
        end
        redirect_to pages_scores_path(@score)
    end
end
