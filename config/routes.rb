Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers
  resources :customers, except: :create do
    collection do
      post :import
    end
    resources :agreements
    resources :headquarters
    resources :power_plants
    resources :ups
  end

  devise_for :employees
  resources :employees, except: :create

  # Name it however you want
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
