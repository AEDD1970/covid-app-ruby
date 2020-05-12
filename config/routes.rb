Rails.application.routes.draw do

  resources :exit_surveys, only: [:index, :create, :update, :destroy, :edit, :new] do
    collection do
      get '/search' => 'exit_surveys#index', :as => 'search'
      post 'reports/output_reports.xls', to: 'exit_surveys#output_reports'
    end
   end
  devise_for :users
  root to: 'home#index'
  resources :employees, only: [:index, :create, :update, :destroy, :edit, :new] do
    collection do
      get '/search' => 'employees#index', :as => 'search'
    end
end

  resources :entrance_surveys, only: [:index, :create, :update, :destroy, :edit, :new] do
    collection do
      get '/search' => 'entrance_surveys#index', :as => 'search'
      post 'reports/entrance_surveys.xls', to: 'entrance_surveys#xls_report'
    end
  end

  resources :reports

end
