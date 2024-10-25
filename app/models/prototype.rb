class Prototype < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_one_attached :image

  validates :text, :title, :catch_copy, :concept, :image, presence: true
end
# 4行目はprotoテーブルとActive Storageのテーブルで
# 管理された画像ファイルのアソシエーションを記述している
