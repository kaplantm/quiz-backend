Rails.application.routes.draw do
  # Use for login and authorize all resource
  use_doorkeeper
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users,
  path: 'v1/users',
  path_names: {
    sign_in: 'signin',
    sign_out: 'signout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'v1/sessions',
    registrations: 'v1/registrations'
  }

  namespace :v1 do
    resources :users, only: [:index]
    resources :quizzes do
      resources :questions
    end
  end
end
