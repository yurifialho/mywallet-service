Rails.application.routes.draw do
  resources :lancamentos
  resources :tipos
  resources :categorias
  resources :contas
  resources :conta_painel, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
