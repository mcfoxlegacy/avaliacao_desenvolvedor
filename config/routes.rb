Rails.application.routes.draw do
  resources :sales, except: [:show]
  root :to => 'sales#index'
end
