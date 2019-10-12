Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :profiles, only: [:index, :show]
  namespace :user do
    resources :profiles, only: [:new, :create, :show, :update]
  end

end
