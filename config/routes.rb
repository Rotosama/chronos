Rails.application.routes.draw do
  devise_for :workers
  resources :departments
  resources :workers do
    resources :vacations do
      member do
        patch 'approve', to: 'vacations#approve'
        patch 'reject', to: 'vacations#reject'
      end
    end
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
