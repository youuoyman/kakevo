Rails.application.routes.draw do
  root 'top#index'
  post 'income_values/new(/:name)' => 'income_values#new'

  resources :incomes
  resources :fixeds
  resources :changes
  resources :income_values
end

