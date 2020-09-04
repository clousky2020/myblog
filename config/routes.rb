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

    resources :categorys
    root 'dashboard#index'

  end
end
