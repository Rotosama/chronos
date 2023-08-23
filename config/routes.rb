Rails.application.routes.draw do

  resources :departments
  resources :workers do

    resources :time_entries do

      resources :breaks
      
    end
  end

  root "workers#index"

end
