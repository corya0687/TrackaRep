Rails.application.routes.draw do

  resources :comments
  resources :plans
  resources :drills, only: [:index, :show]

  devise_for :users, :path => 'account', :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :workouts, only: [:index, :show]

  resources :users do
    resources :workouts, only: [:new, :destroy, :edit, :create, :update]
    
    resources :runs, only:[:index,:show]

    resources :exercises, only: [:new, :destroy, :edit, :create, :update] do
      resources :runs do
        resources :drills, except: [:index, :show]
      end

    end
  end
  resources :exercises, only: [:index, :show]

  root 'welcome#index'

  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
