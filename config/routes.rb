Rails.application.routes.draw do
  root "searches#index"

  resource :search, only: [:create]
end