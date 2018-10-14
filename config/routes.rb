Rails.application.routes.draw do
  root 'tests#index'

  get 'sessions/new'
  get 'users/new'
  get 'sessions/destroy'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: [:create, :destroy]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :surveys, only: %i[show update] do
    get :result, on: :member
  end
end
