Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'show' => 'users#show'

  root 'users#index'

  # Эти две строчки добавляют ресурсы для пользователей и вопросов. Ресурс — это
  # набор путей для управления соответствующей моделью. Посмотрите, что напишет
  # команда
  #
  # rake routes
  resources :users
  resources :questions
end
