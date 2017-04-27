Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations"}
 


  get 'welcome/index'





 
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
     
      resources :groupsapi do
        resources :individualsapi do
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

  mount ActionCable.server, at: '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
