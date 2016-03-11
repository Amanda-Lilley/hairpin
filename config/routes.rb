Rails.application.routes.draw do
  resources :styles

  root "styles#index"


end
