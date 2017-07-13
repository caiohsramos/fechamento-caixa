Rails.application.routes.draw do
  root :to => 'caixas#index'
  resources :caixas do
    resources :despesas
  end
end
