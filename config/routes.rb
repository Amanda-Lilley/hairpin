Rails.application.routes.draw do
  devise_for :users
  resources :styles do
    member do
      put "like", to: "styles#upvote"
    end
  end

  root "styles#index"


end
