Rails.application.routes.draw do
  resources :meetings
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
  resources :tags, except: :show

  get 'tags/:tag', to: 'projects#index'

  devise_for :users

  resources :users

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  root "projects#index"
  resources :projects do
    resource :group, module: :projects
    resource :like, module: :projects
    resources :ideas
  end
end
