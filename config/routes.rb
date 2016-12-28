Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  resources :groups do
  	resources :individuals
  end


  authenticated :user do 
  	root "groups#index", as: "authenticated_root"
  end



  root'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
