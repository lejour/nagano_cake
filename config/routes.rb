Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admin/sessions',
  }
  devise_for :customers, skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  namespace :admin do
    resources :customers
  end

  scope module: :public do
    get '/customers/current_customer' => 'customers#show'
    get '/customers/current_customer/edit' => 'customers#edit'
    patch '/customers/current_customer' => 'customers#update'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get '/orders/finish' => 'orders#finish'
    resources :orders, only: [:new, :index, :create, :show,]
    post '/orders/confirm' => 'orders#confirm'

  end


  namespace :admin do
    resources :items
  end

  scope module: :public do
    resources :items
    # get '/cart_items' => 'cart_items#index'
    # delete '/cart_items/:id' => 'cart_items#destroy', as: 'cart_item'
    # post '/cart_items' => 'cart_items#create'
    # patch '/cart_items/:id' => 'cart_items#update'
  end


  scope module: :admin do
    get '/admin/orders/:id' => 'orders#show', as: 'admin_orders'
  end

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
  end

  scope module: :admin do
    get '/admin' => "homes#top", as: 'admin'
  end

end
