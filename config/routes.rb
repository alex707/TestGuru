Rails.application.routes.draw do

  root 'tests#index'

  resources :feedbacks, only: %i[create new]

  get 'badges/index'
  get 'badges/my'

  devise_for :users, path: :gurus, path_names: { sign_id: :login, sign_out: :logout }

  resources :tests, only: %i[index show] do
    post :start, on: :member
  end

  resources :surveys, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
    resources :badges
  end
end
