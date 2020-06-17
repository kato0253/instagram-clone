Rails.application.routes.draw do
  get  "users/user_favorite"  => "users#user_favorite"
  root 'sessions#new'
  get 'sessions/new'
  post'sessions/new'
  # post 'users/:id/edit', to: 'users#edit'

  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions
  resources :contacts
  resources :favorites, only: [:create, :destroy, :show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
