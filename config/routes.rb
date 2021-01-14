Rails.application.routes.draw do
  
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
    resources :comments, only: [:create, :destroy]
  end
end
