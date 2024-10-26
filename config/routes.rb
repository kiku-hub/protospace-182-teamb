Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'  # ルートパスを prototypes の index アクションに設定

  resources :prototypes, only: [:index, :show, :new, :create, :edit, :update, :destroy]  do
    resources :comments, only: [:create] # comments を prototypes にネスト
  end

  resources :users, only: [:show]  # users リソースを設定
end
