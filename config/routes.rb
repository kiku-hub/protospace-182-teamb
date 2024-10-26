Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'  # ルートパスをprototypesのindexアクションに設定

  resources :prototypes, only: [:index, :show, :new, :create, :edit, :update, :destroy]  # prototypesコントローラーの全アクションを定義

  resources :users, only: [:show] do
  resources :prototypes, only: [:index]  # 特定のユーザーに関連するプロトタイプを取得
  resources :comments, only: [:create]  # prototypesに対するcommentsのcreateアクションのルーティングを追加
  end
end
