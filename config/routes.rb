Rails.application.routes.draw do


  devise_for :teachers

  devise_for :users

  root 'homepage#show'
end