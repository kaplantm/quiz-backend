class V1::QuizzesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    before_action :set_quiz, only: [:show, :update, :destroy]
    
    # GET /quizzes
    def index
        @quizzes = Quiz.all
        json_response(@quizzes)
    end
    
    # POST /quizzes
    def create
        @quiz = Quiz.create!(quiz_params)
        json_response(@quiz, :created)
    end
    
    # GET /quizzes/:id
    def show 
        Rails.logger.info(request.headers['origin'])
        if request.query_parameters.has_key?(:details)  && request.query_parameters[:details] === "true"
            render :json => @quiz.to_json(:include =>  :questions )
            return
        end
        json_response(@quiz)
    end
    
    # PUT /quizzes/:id
    def update
        @quiz.update(quiz_params)
        head :no_content
    end
    
    # DELETE /quizzes/:id
    def destroy
        @quiz.destroy
        head :no_content
    end
    
    private
    
    def quiz_params
        # whitelist params
        params.permit(:title, :created_by, :difficulty).merge(user_id: current_user.id)
    end
    
    def set_quiz
        @quiz = Quiz.find(params[:id])
    end
end
