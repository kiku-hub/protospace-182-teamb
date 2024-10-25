Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'  # ルートパスをprototypesのindexアクションに設定

  resources :prototypes, only: [:index]  # prototypesコントローラーのindexアクションのみを定義
  resources :users, only: [:show ]  # ユーザーの詳細表示用ルートを追加
end