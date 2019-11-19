class V1::QuestionsController < ApplicationController
    before_action :set_quiz, only: [:create, :update, :destroy]
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
        puts question_params[:quiz_id]
        if request.query_parameters.has_key?(:bulk)  && request.query_parameters[:bulk] === "true"
            if question_params.has_key?(:questions) && question_params[:questions].length > 1
                questions = question_params[:questions].map { |q|
                q[:quiz_id] = 1; 
                q[:created_at] = Time.now; 
                q[:updated_at] = Time.now; 
                if q[:difficulty]
                    if q[:difficulty] > 3 || q[:difficulty] < 1
                        return json_response({ error: "Bad Request: Difficulty must between 1 and 3 (inclusive)." }, 400)
                    end
                end
                q 
            }
                @quiz.questions.insert_all(questions)
            else
                return json_response({ error: "Bad Request: Missing or empty questions array in bulk update attempt." }, 400)
            end
        else #handle individual create
            @quiz.questions.create(question_params)
        end
        json_response(@quiz.questions, :created)
    end
    
    # PUT /quizzes/:quiz_id/questions/:id
    def update # TODO: bulk edit
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
        params.permit(:quiz_id, :question, :answer, :difficulty, :questionHeader, :answerHeader, :questions => [:question, :answer, :difficulty, :questionHeader, :answerHeader])
    end
    
    def set_quiz
        @quiz = Quiz.find(params[:quiz_id])
    end
    
    def set_quiz_question
        @question = @quiz.questions.find_by!(id: params[:id]) if @quiz
    end
end