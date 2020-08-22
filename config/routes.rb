Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'

  resources :articles, only: [:index, :show] do
    resources :comments
  end
  get "/about", to: "articles#about"

  namespace :admin do
    resources :articles, except: [:show] do
      collection do
        post :preview
      end
      resources :comments
    end
    resources :sessions, :only => [:new, :create]
    get "/logout", to: "sessions#destroy"
    resources :subscribes, only: [:index] do
      member do
        post :enable
        post :disable
      end
    end
    # root 'dashboard#index'
    root 'articles#index'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
