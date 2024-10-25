class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
end

# 以下カリキュラムより
# アソシエーションでbelongs_toを指定した場合は、相手のモデルのid（今回はuser_id）が
# 存在するというバリデーションは不要。本章の冒頭の「ツイートにユーザー情報を追加」
# という項目で、tweetsテーブルにuser_idというカラムを追加しました。
# そこにツイートを投稿したユーザーのidを保存する仕組みになっている
