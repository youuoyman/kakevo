Rails.application.routes.draw do
  root 'top#index'

  resources :incomes
  resources :fixeds
  resources :changes
  resources :income_values
end

