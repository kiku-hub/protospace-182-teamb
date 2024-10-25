Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'  # ルートパスをprototypesのindexアクションに設定
  resources :tweets, only: [:index, :new, :create]
end
