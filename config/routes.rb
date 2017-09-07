Rails.application.routes.draw do
  root :to => 'caixas#index'
  get 'despesas/', to: 'despesas#index', defaults: {format: 'csv'}
  resources :caixas do
    resources :despesas
  end
end
