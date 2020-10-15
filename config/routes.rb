Rails.application.routes.draw do

  # 博客
  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'

  resources :articles, only: [:index, :show] do
    resources :comments
  end
  get "/about", to: "articles#about"
  post "/search", to: "articles#search"

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

  # 招聘网站
  namespace :recruitment do
    root "jobs#index"
    post "/job_search", to: "jobs#job_search"
    resources :jobs, :only => [:index, :show]
    resources :sessions, :only => [:new, :create, :destroy]
    resources :company_sessions, :only => [:new, :create, :destroy]
    resources :register, :only => [:new, :create]
    resources :company_register, :only => [:new, :create]
    namespace :admin do
      resources :jobs do
        member do
          get :push
          get :job_resumes
        end
      end
      resources :user do
        resources :resumes, :only => [:new, :show, :update] do
          member do
            get :send_resume
          end
        end
      end
    end
  end


end
