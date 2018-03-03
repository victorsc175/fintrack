Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: :sessions,
                                    registrations: :registrations }
  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resources :friendships
  get 'my_friends', to: 'users#my_friends'
  get 'my_portfolio', to: 'users#my_portfolio' 
  get 'search_stocks', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  root 'welcome#index'
  mount ActionCable.server => '/cable'
end
