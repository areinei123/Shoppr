Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users, :controllers => {registrations: 'registrations' }

  resources :groups, only: [:index, :show, :destroy]
  resources :groups, only: [:index, :show, :destroy, :edit, :update] do
    resources :memberships, only: [:create]
  end
end
