Rails.application.routes.draw do
   root to: "public/homes#top"
    get "/about" => "public/homes#about", as: "about"
    get "public/customers" => "public/customers#show", as: "my_page"
    patch 'item/:id' => 'item#update', as: 'update_item'

    devise_for :customers,skip:[:passwords,],controllers:{
      registrations: "public/registrations",
      sessions: 'public/sessions'
     }
      devise_for :admin,skip: [:registrations, :passwords] ,controllers:{
      sessions: "admin/sessions"
      }
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      scope module: :public do
      resources :items, only: [:index, :show]
       get "/customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
      patch "/customers/withdraw" => "customers#withdraw", as: "withdraw"
      resources :customers, only: [:show, :edit, :update]
      post "/orders/cimfirm" => "orders#comfirm", as: "comfirm"
      get "/orders/complete" => "orders#complete", as: "complete"
      resources :orders, only: [:new, :index, :show, :create]
      resources :registrations, only: [:new, :create]
      delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"

    end
       namespace :admin do
        resources :customers, :genres, :homes, :items
      end
    end
