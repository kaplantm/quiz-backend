class QuestionsController < ApplicationController
    before_action :set_quiz
    before_action :set_quiz_question, only: [:show, :update, :destroy]
    
    # GET /quizzes/:quiz_id/questions
    def index
        json_response(@quiz.questions)
    end
    
    # GET /quizzes/:quiz_id/questions/:id
    def show
        json_response(@question)
    end
    
    # POST /quizzes/:quiz_id/questions
    def create
        @quiz.questions.create!(question_params)
        json_response(@quiz, :created)
    end
    
    # PUT /quizzes/:quiz_id/questions/:id
    def update
        @question.update(question_params)
        head :no_content
    end
    
    # DELETE /quizzes/:quiz_id/questions/:id
    def destroy
        @question.destroy
        head :no_content
    end
    
    private
    
    def question_params
        params.permit(:question, :answer, :difficulty, :questionHeader, :answerHeader)
    end
    
    def set_quiz
        @quiz = Quiz.find(params[:quiz_id])
    end
    
    def set_quiz_question
        @question = @quiz.questions.find_by!(id: params[:id]) if @quiz
    end
end
