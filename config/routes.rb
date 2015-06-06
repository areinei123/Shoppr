Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users, :controllers => {registrations: 'registrations' }

  resources :groups, only: [:index, :show, :destroy, :edit, :update]
end
