Rails.application.routes.draw do

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :comments
    resources :plans
    resources :drills, only: [:index, :show, :create]

    devise_for :users, :path => 'account', skip: :omniauth_callbacks

    resources :workouts, only: [:index, :show]

    resources :users do
      resources :workouts, only: [:new, :destroy, :edit, :create, :update] do
        resources :runs do
          resources :drills, except: [:index, :show, :create]
        end
      end

      resources :runs, only: [:create, :index, :show] do
        resources :drills
      end

      resources :exercises, only: [:new, :destroy, :edit, :create, :update] do
        resources :runs do
          resources :drills, except: [:index, :show, :create]
        end
      end

    end

   resources :runs, only: [:index, :show, :edit, :update, :destroy]
   resources :workouts, only: [:index, :show]
   resources :exercises, only: [:index, :show]
   get 'index', to: 'welcome#index'

     root 'welcome#home'

end
