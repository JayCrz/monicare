Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  get '/api', to: 'api#search'
  get '/notification', to: 'api#notification'
  
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
