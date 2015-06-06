Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users, :controllers => {registrations: 'registrations' }

  resources :groups, only: [:index, :show, :create, :destroy, :edit, :update] do
    resources :memberships, only: [:create]
    resources :grocery_lists
  end
end
