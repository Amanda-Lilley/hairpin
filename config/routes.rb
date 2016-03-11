Rails.application.routes.draw do
  devise_for :users
  resources :styles

  root "styles#index"


end
