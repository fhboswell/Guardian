Rails.application.routes.draw do
   devise_for :users
  get 'welcome/index'



  get 'home' => 'home#index'

  post 'auth_user' => 'authentication#authenticate_user'



 
  resources :groups do
  	resources :individuals do
      member do
        patch :change
      end
    end
  end


  namespace :api do 
    namespace :v1 do 
      get 'home' => 'home#index'
      post 'auth_user' => 'authentication#authenticate_user'
     
      resources :groups, only: [:index, :create, :show, :update, :destroy] do
        resources :individuals, only: [:index, :create, :show, :update, :destroy] do
          member do
            patch :change
          end
        end
      end
    end 
  end


  authenticated :user do 
  	root "groups#index", as: "authenticated_root"
  end



  root'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
