Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, except: [:show, :edit, :update]
  get 'stocks/search'
  get 'users/my_portfolio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio' 
  get 'search_stocks', to: 'stocks#search'
end
