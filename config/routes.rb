Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users
  root "projects#index"
  resources :projects do
    resources :ideas
  end
end
