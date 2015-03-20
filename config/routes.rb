Rails.application.routes.draw do

  devise_for :users

  root 'dashboard#index'

  resources :tracks do
    member do
      get :get_points
    end
  end

end
