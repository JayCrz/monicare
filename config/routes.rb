Rails.application.routes.draw do

  resources :teachers, only:[:index, :show]
  root 'teachers#index'
end