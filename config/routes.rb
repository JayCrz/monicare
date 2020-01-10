Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  
  namespace :api do
    get '/search_student', to: 'api#search'
    get '/search_dashboard', to: 'api#search_dashboard'
    get '/notification', to: 'api#notification'
  end
  root 'homepage#show'
  
  resource :dashboard, only:[:show] do
    resources :children do 
      get :overview
      resources :eat, except:[:index]
      resources :pick_up
      resources :misc, except:[:index]
      resources :medicine, except:[:index] 
    end
  end
  
  namespace :teacher do
    resource :dashboard, only:[:show] do
      resources :myclass, only:[:show]
      resources :children do 
        get :overview
        resources :eat, except:[:index]
        resources :pick_up
        resources :misc, except:[:index]
        resources :medicine, except:[:index] 
      end
    end
  end
end
