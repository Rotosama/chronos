Rails.application.routes.draw do
  resources :vacations
  devise_for :workers
  resources :departments
  resources :workers do
    resources :vacations
    resources :time_entries do
      member do
        patch 'close_day', to: 'time_entries#close_day'
      end
      resources :breaks do
        member do
          patch 'stop_pause', to: 'breaks#stop_pause' 
        end
      end
    end
  end
  root "workers#index"
end
