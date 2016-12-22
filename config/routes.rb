Rails.application.routes.draw do
  get 'users/show'

  get 'users/edit'

  get 'users/update'

  namespace :admin do
    root 'application#index'
    resources :users do
      member do
        patch :archive
      end
    end
  end

  devise_for :users

  resources :users

  root "projects#index"
  resources :projects do
    resource :like, module: :projects
    resources :ideas
  end
end
