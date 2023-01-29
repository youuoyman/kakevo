Rails.application.routes.draw do
  root  'top#index'
  post "income_values/new(/:name)" => "income_values#new"
  post "fixed_values/new(/:name)" => "fixed_values#new"
  post "change_values/new(/:name)" => "change_values#new"

  get "balance_payment" => "balance_payment#top"
  post "balnace_payment/show(/:name)" => "balance_payment#show"
  
  resources :incomes
  resources :fixeds
  resources :changes
  resources :income_values
  resources :fixed_values
  resources :change_values
end

