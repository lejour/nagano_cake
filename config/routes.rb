Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admin/sessions',
  }
  devise_for :customers, skip: [:passwords], controllers: {
    sessions:      'customers/sessions',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

end
