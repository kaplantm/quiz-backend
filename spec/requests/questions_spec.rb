require 'rails_helper'

RSpec.describe 'Questions API' do
  # Initialize the test data
  let!(:quiz) { create(:quiz) }
  let!(:questions) { create_list(:question, 20, quiz_id: quiz.id) }
  let(:quiz_id) { quiz.id }
  let(:id) { questions.first.id }

  # Test suite for GET /quizzes/:quiz_id/questions
  describe 'GET /quizzes/:quiz_id/questions' do
    before { get "/quizzes/#{quiz_id}/questions" }

    context 'when quiz exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all quiz questions' do
        expect(json.size).to eq(20)
      end
    end

    context 'when quiz does not exist' do
      let(:quiz_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Quiz/)
      end
    end
  end

#   Test suite for GET /quizzes/:quiz_id/questions/:id
  describe 'GET /quizzes/:quiz_id/questions/:id' do
    before { get "/quizzes/#{quiz_id}/questions/#{id}" }

    context 'when quiz question exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the question' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when quiz question does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end

  # Test suite for PUT /quizzes/:quiz_id/questions
  describe 'POST /quizzes/:quiz_id/questions' do
    let(:valid_attributes) { { question: 'question', answer: "answer" } }

    context 'when request attributes are valid' do
      before { post "/quizzes/#{quiz_id}/questions", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/quizzes/#{quiz_id}/questions", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Question can't be blank, Answer can't be blank/)
      end
    end
  end

#   # Test suite for PUT /quizzes/:quiz_id/questions/:id
  describe 'PUT /quizzes/:quiz_id/questions/:id' do
    let(:valid_attributes) { {question: 'question2', answer: "answer2"  } }

    before { put "/quizzes/#{quiz_id}/questions/#{id}", params: valid_attributes }

    context 'when question exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the question' do
        updated_question = Question.find(id)
        expect(updated_question.question).to match(/question2/)
        expect(updated_question.answer).to match(/answer2/)
      end
    end

    context 'when the question does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end

  # Test suite for DELETE /quizzes/:id
  describe 'DELETE /quizzes/:id' do
    before { delete "/quizzes/#{quiz_id}/questions/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end