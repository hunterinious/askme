Rails.application.routes.draw do
  root 'users#index'

  # Ресурс пользователей
  resources :users

  # Ресурс сессий (только три экшена :new, :create, :destroy)
  resource :session, only: [:new, :create, :destroy]

  # Ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :questions, except: [:show, :new, :index]

  resources :tags, only: :show, param: :name
end
