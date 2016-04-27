Rails.application.routes.draw do
  root to: "registers#new"
  resources :registers, only: [:create, :index]
end
