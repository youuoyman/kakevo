Rails.application.routes.draw do
  root  'top#index'
  post "income_values/new(/:name)" => "income_values#new"
  post "fixed_values/new(/:name)" => "fixed_values#new"
  post "change_values/new(/:name)" => "change_values#new"

  resources :incomes
  resources :fixeds
  resources :changes
  resources :income_values
  resources :fixed_values
  resources :change_values
end

