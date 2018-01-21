Rails.application.routes.draw do

  resources :categories
	resources :items do
	  	member do
	  		patch :complete
	  	end
	end

  get 'tags/:tag', to: 'items#index', as: :tag	
  root 'items#index'

end
