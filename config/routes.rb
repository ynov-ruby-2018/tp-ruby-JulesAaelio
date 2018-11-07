Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "message#index"
  resources :message

  post '/message/:id/like', to: 'message#like', as: 'message_like'
  post '/message/:id/dislike', to: 'message#dislike', as: 'message_dislike'
end
