Rails.application.routes.draw do

  resources :exit_surveys, only: [:index, :create, :show, :destroy, :update] do
  collection do
    post '/', action: :index
     end
   end
  devise_for :users
  root to: 'home#index'
  resources :employees , only: [:index, :create, :update, :destroy, :edit, :new] do
    collection do
      get '/search' => 'employees#index', :as => 'search'
    end
end
  resources :surveys_history
  resources :entrance_surveys, only: [:index, :create, :update, :destroy, :edit, :new] do
    collection do
      get '/search' => 'entrance_surveys#index', :as => 'search'
    end
    end

  # resources :employees, only: [:index, :create, :update, :destroy, :edit] do
  #   collection do
  #     # post "employee", action: :new
  #     # get "find_for_period/:period", action: :find_for_period #period => YYYYMMM ejemplo 201806
  #     # get "find_for_day/:day", action: :find_for_day #day => YYYYMMMDD ejemplo 20180621
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
