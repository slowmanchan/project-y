Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :users do
      member do
        patch :archive
      end
    end
  end

  devise_for :users
  root "projects#index"
  resources :projects do
    resources :ideas
  end
end
