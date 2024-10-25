class Prototype < ApplicationRecord
  validates :text, :title, :catch_copy, :concept, :image, presence: true
  belongs_to :user
  has_one_attached :image
end
# 4行目はprotoテーブルとActive Storageのテーブルで
# 管理された画像ファイルのアソシエーションを記述している
