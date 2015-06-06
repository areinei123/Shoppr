Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users, :controllers => {registrations: 'registrations' }

  resources :groups, only: [:index, :show, :create, :destroy] do
    resources :memberships, only: [:create, :destroy]
    resources :grocery_lists
  end
end
