Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :profiles do
    resources :comments, only: [:new, :create, :show, :update]
  end
  namespace :user do
    resources :profiles do
      resources :comments, only: [:new, :create, :show, :update]
    end
  end

end
