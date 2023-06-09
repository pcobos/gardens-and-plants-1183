Rails.application.routes.draw do
  get 'plants/create'
  resources :gardens do
    resources :plants, only: :create
  end
end
