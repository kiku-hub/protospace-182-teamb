class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    redirect_to '/'
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end

# merge(user_id: current_user.id)を追加しているのは
# prototypeテーブルがuserテーブルと関連付けられており、user_idが必須
# （null: false）だから。

# current_user.idは、Deviseで提供される現在ログインしている
# ユーザーのIDを取得するメソッド。
