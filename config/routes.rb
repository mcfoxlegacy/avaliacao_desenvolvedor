Rails.application.routes.draw do
  resources :sales, except: [:show, :edit, :update] do
    post :import, on: :collection
  end
  root :to => 'sales#index'
end
