# ProtoSpaceのER図

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

## アソシエーション
has_many :prototypes: 1人のユーザーは複数のプロトタイプを作成できる。
has_many :comments: 1人のユーザーは複数のコメントを残すことができる。

## prototypes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

## アソシエーション
belongs_to :user: 各プロトタイプは1人のユーザーに属する。
has_many :comments: 1つのプロトタイプには複数のコメントが関連付けられる。

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

## アソシエーション
belongs_to :user: 各コメントは1人のユーザーによって作成される。
belongs_to :prototype: 各コメントは特定のプロトタイプに関連付けられる。
