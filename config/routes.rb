Rails.application.routes.draw do
  devise_for :users, controllers: { registration: 'user/registration' }
  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resources :friendships
  get 'stocks/search'
  get 'users/my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio' 
  get 'search_stocks', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
end
