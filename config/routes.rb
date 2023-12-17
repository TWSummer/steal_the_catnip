Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  get 'game', to: 'game#new', as: 'new_game'
  post 'game', to: 'game#create', as: 'create_game'
  get 'game/:room_code/lobby', to: 'game#lobby', as: 'game_lobby'
  post 'game/lobby', to: 'game#join', as: 'join_game'
  get 'game/:room_code/ready', to: 'game#ready', as: 'check_if_game_ready'
  get 'game/:room_code/play', to: 'game#play', as: 'play_game'
  post 'game/:room_code/round/:round_number', to: 'round#submit', as: 'submit_plan'
  get 'game/:room_code/round/:round_number', to: 'round#view', as: 'view_round'
  get 'game/:room_code/round/:round_number/check_result', to: 'round#check_result', as: 'check_for_round_result'
  post 'game/:room_code/round/:round_number/next_round', to: 'round#next_round', as: 'next_round'
  get 'game/:room_code/round/:round_number/next_round', to: 'round#check_if_all_players_ready'
end
