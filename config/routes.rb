Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #sidekiq monitor
  require "sidekiq/web"
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    resources :event_logs, only: [:create]
  end

  get "question1/answer", to: "questions#question1"
  get "question2/answer", to: "questions#question2"
  get "question3/answer", to: "questions#question3"
  get "question4/answer", to: "questions#question4"
end
