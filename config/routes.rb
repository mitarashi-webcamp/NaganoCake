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
  resources :delivery_addresses, only:[:index,:edit]
  resources :orders, only:[:new,:complete,:index,:show]
  resources :cart_products, only:[:index]
  resources :customers, only:[:show,:edit,:comfirm]
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
