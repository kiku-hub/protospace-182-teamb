Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'  # ルートパスをprototypesのindexアクションに設定
  resources :prototypes
end

# resourcesの後は複数形に