Rails.application.routes.draw do
  devise_for :users
  resources :groups do
   member do
      put :invite
    end
  end
  resources :memberships
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'groups#index'

end
