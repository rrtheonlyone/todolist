Rails.application.routes.draw do

  resources :categories
	resources :items do
	  	member do
	  		patch :complete
	  	end
	end

	
	root 'items#index'

end
