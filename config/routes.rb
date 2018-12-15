Rails.application.routes.draw do
  devise_for :users
  root to: 'home#show', as: :root

  resources :questions do
    get :follow, on: :member
    get :unfollow, on: :member
  end
  resources :answers, only: [:create] do
    get :vote_up, on: :member
    get :vote_down, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
