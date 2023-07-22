Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admin/sessions',
  }
  devise_for :customers, skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/customers/current_customer' => 'customers#show'
  get '/customers/current_customer/edit' => 'customers#edit'
  patch '/customers/current_customer' => 'customers#update'

  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

end
