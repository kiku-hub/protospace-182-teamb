class Comment < ApplicationRecord
  belongs_to :user # 各コメントは1人のユーザーによって作成される
  belongs_to :prototype # 各コメントは特定のプロトタイプに関連付けられる

  validates :content, presence: true
end
