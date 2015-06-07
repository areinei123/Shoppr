Rails.application.routes.draw do
  get 'grocery_items_controller/index'

  root 'groups#index'
  devise_for :users, :controllers => {registrations: 'registrations' }

  resources :groups, only: [:index, :show, :create, :destroy, :edit, :update] do
    resources :memberships, only: [:create, :destroy]
    resources :grocery_lists, only: [:index, :show, :new, :create, :destroy]
  end
  resources :grocery_lists, only: [:index, :show, :new, :create, :destroy] do
    resources :supplies, only: [:index, :new, :create]
    resources :grocery_items, only: [:edit, :update]
  end
end
