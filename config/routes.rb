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

  namespace :questions do
    get "/questions", to: "application#index"    

    get "/question1/answer", to: "questions1#answer"
    get "/question2/answer", to: "questions2#answer"
    get "/question3/answer", to: "questions3#answer"
    get "/question4/answer", to: "questions4#answer"
    get "/question5/answer", to: "questions5#answer"
    get "/question6/answer", to: "questions6#answer"
  end
end
