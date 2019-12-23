Rails.application.routes.draw do

  resources :teachers, only:[:index, :show] do
    member do
      get :student #/teacher/:id/stenduen/:id
    end
  end
  root 'president#index'
end