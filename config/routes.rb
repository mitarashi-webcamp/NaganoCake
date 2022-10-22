Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  scope module: :public do
  root :to =>"homes#top"
  get "homes/about"=>"homes#about"
  get "customers/comfirm" => "customers#comfirm"
  resources :delivery_addresses, only:[:index,:edit,:create,:update,:destroy]
  resources :orders, only:[:new,:comfirm,:complete,:create,:index,:show]
  resources :carts, only:[:index,:create,:update,:destroy,:all_destroy]
  resource :customers, only:[:show,:edit,:update,:comfirm,:withdraw]
  resources :products, only:[:index,:show]
  end

  namespace :admin do

  root :to =>"homes#top"
  resources :products, only:[:index,:new,:create,:show,:edit,:update]
  resources :customers, only:[:index,:show,:edit,:update]
  resources :orders, only:[:show,:update]
  resources :genres, only:[:index,:create,:edit,:update]
  resources :order_products, only:[:update]


  end



end
