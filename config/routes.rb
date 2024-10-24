Rails.application.routes.draw do
  root to: 'prototypes#index'  # ルートパスをprototypesのindexアクションに設定
  resources :prototypes, only: [:index]  # prototypesコントローラーのindexアクションのみを定義

end
