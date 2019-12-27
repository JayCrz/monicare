Rails.application.routes.draw do


  devise_for :teachers

  devise_for :users
  resources :teachers, only:[:index, :show] do	
    member do
      get :student #/teacher/:id/stenduen/:id	
    end	
  end	
  root 'teachers#index'	
end
