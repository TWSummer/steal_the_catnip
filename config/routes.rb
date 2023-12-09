Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  get 'game', to: 'game#new'
  post 'game', to: 'game#create', as: 'create_game'
  get 'game/:room_code/lobby', to: 'game#lobby', as: 'game_lobby'
end
