Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new'
  # post 'users/:id/edit', to: 'users#edit'

  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions
  resources :contacts
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
