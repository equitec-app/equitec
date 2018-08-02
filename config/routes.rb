Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  post 'searchs/customers', to: 'searchs#customers', as: 'search_customers'
  post 'searchs/power_plants', to: 'searchs#power_plants', as: 'search_power_plants'
  post 'searchs/ups', to: 'searchs#ups', as: 'search_ups'

  devise_for :customers
  resources :visits, only: [:index]

  resources :customers, except: :create do
    collection do
      post :import
    end
    resources :visits, except: [:index]
    resources :agreements
    resources :headquarters
    resources :power_plants
    resources :ups
  end

  devise_for :employees
  resources :employees, except: :create

  post 'create_employees' => 'employees#create', as: :create_employees
  post 'create_customers' => 'customers#create', as: :create_customers

  devise_scope :customer do
    authenticated :customer do
      root :to => 'customers#show'
    end
    authenticated :employee do
      root :to => 'employees#show'
    end
    unauthenticated :customer do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
