IsfitCore::Application.routes.draw do

 # match 'user/edit' => 'users#edit', :as => :edit_current_user

 # match 'signup' => 'users#new', :as => :signup

  resources :users

  resources :roles
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  resources :sessions
 # resources :organization do
 #   resources :festivals do
 #     resources :sections do
 #       resources :groups do
 #         resources :positions
 #       end
 #     end
 #     resources :groups do
 #       resources :positions
 #     end
 #   end
 #   resources :groups do
 #     resources :positions
 #   end
 # end

  resources :organization do
    resources :festivals
    resources :groups
  end
  resources :festivals do
    resources :sections
    resources :groups
  end
  resources :sections do
    resources :groups
  end
  resources :groups do
    resources :positions
  end
  resources :positions do
    resources :people
  end
  resources :people
  resources :isfit
  #match ':controller/:action' => '#index'
  root :to => "organization#show"
end
