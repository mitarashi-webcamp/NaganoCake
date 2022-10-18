Rails.application.routes.draw do
  get 'delivery_addresses/index'
  get 'delivery_addresses/edit'
  get 'orders/new'
  get 'orders/complete'
  get 'orders/index'
  get 'orders/show'
  get 'cart_products/index'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/comfirm'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'registrations/new'
  get 'registrations/create'
  get 'products/index'
  get 'products/show'
  get 'homes/top'
  get 'homes/about'
  devise_for :admins
  devise_for :customers
end
