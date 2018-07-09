Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers
  resources :customers

  devise_for :employees
  resources :employees


  # authenticated :customer do
  #   root 'customer#show', as: :authenticated_root
  # end
  #
  # root "devise/sessions#new"

  # devise_scope :user do
  #   root :to => 'devise/sessions#new'
  # end

  devise_scope :customer do
    authenticated :customer do
      root :to => 'customers#show'
    end
    unauthenticated :customer do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
