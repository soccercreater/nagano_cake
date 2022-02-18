Rails.application.routes.draw do

  devise_for :customers,skip:[:passwords],controllers:{
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords] ,controllers:{
   sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"
  get "/admin" => "admin/homes#top", as: "admin"
  patch 'item/:id' => 'item#update', as: 'update_item'
  patch 'genres/:id' => 'genres#update', as: 'update_genres'

  scope module: :public do
   resources :items, only: [:index, :show]
   get "/customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
   patch "/customers/withdraw" => "customers#withdraw", as: "withdraw"
   resources :customers, only: [:edit, :update]
   post "/orders/confirm" => "orders#confirm", as: "confirm"
   get "/orders/complete" => "orders#complete", as: "complete"
   get "my_page" => "customers#show", as: "my_page"
   resources :orders, only: [:new, :index, :show, :create]
   delete "/cart_items/:id/destroy" => "cart_items#destroy", as: "destroy"
   delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"
   resources :addresses, only: [:create, :edit, :update, :destroy, :index]
   resources :cart_items, only: [:index, :create, :update]
  end

  namespace :admin do
    resources :customers, :genres, :homes, :items
    resources :orders, only: [:show, :update]
    patch 'customers/:id' => 'customers#update', as: 'update_customers'
    patch 'order_details/:id' => 'order_details#update', as: 'order_details'
  end
 end
