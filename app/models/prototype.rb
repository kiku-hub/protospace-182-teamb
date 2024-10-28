class Prototype < ApplicationRecord
  validates  :title, :catch_copy, :concept, :image, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
end
# 4行目はprotoテーブルとActive Storageのテーブルで
# 管理された画像ファイルのアソシエーションを記述している
