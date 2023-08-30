Rails.application.routes.draw do

  resources :departments
  resources :workers do

    resources :time_entries do
      member do
        patch 'close_day', to: 'time_entries#close_day'
      end

      resources :breaks
      
    end
  end

  root "workers#index"

end
