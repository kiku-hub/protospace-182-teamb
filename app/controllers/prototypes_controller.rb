class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).all
    # includesを追加してN+1問題を回避
  end

  def show
  end

  # @prototypes = Prototype.includes(:user).all:
  # Prototypeモデルのすべてのレコードを取得し、@prototypesに代入
  # このとき、関連するUserモデルも一緒にロードする
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  # prototype_paramsメソッドを使って受け取ったフォームデータから
  # 新しいPrototypeオブジェクトを生成し、保存を試みます。保存に
  # 成功すれば、ルートパスにリダイレクトし、失敗すれば新規作成フォームを再表示します。

  # renderメソッドは、Railsビューにおいて特定のテンプレートや部分
  # テンプレート（パーシャル）を表示するために使用されます。特に、
  # partial: "partial_name", collection: collectionの形式
  # で使われると、指定された部分テンプレートをコレクションの各要素
  # に対して繰り返しレンダリングします。

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
