Rails.application.routes.draw do

   scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders, only: [:new, :create, :confirm, :complete, :index, :show]



    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'

    get 'customers/show'
    get 'customers/edit'
    get 'customers/check'
    patch 'customers/withdraw'
    patch 'customers/update'

    resources :items, only: [:show, :index]
  end

  namespace :admin do
    get "/" => "homes#top"
    root to: 'homes#top'
    resources :items, only: [:show, :index, :new, :create, :edit, :update]

    resources :customers, only: [:index, :edit, :update, :show]

    get 'orders/show'  => "orders#show"
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
