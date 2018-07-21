Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'soom_cards#index'

  # With SoomCards Controller
  get '/soomcards' => 'soom_cards#index'
  get '/soomcards/new' => 'soom_cards#new'
  post '/soomcards/create' => 'soom_cards#create'
  delete '/soomcards/:datetime/list/:id' => 'soom_cards#destroy'
  get '/soomcards/:datetime/list' => 'soom_cards#day_list'
  get '/soomcards/pop_card/:id' => 'soom_cards#pop_card'
  get '/soomcards/self_soom' => 'soom_cards#self_soom'
  get '/soomcards/deulsoom' => 'soom_cards#deul_soom'
  get '/soomcards/nalsoom' => 'soom_cards#nal_soom'
  get '/notice' => 'soom_cards#notice'

  
  # With Friends Controller
  get '/friends/new' => 'friends#new'
  get '/friends/list' => 'friends#friends_list'
  post '/friends' => 'friends#create'
  delete '/friends/:id' => 'friends#destroy'


end
