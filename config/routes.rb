Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
  put 'users/withdraw' => 'users#withdraw'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]
end
