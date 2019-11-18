Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1 do
   # add our auth routes
   post 'auth/sign_up', to: 'users#sign_up'
   post 'auth/sign_in', to: 'users#sign_in'
   get 'auth/refresh_token', to: 'users#refresh_token'
  #  post 'auth/end_session', to: 'users#end_session'
    resources :quizzes do
      resources :questions
    end
  end
end
