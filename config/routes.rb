Rails.application.routes.draw do
  root 'uploads#index'

  resources :uploads do 
  	member {
  		post :process_file
  	}
  end
  resources :accounts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
