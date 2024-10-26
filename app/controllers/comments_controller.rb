class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params) # コメントオブジェクトを初期化
    if @comment.save
      redirect_to prototype_path(@comment.prototype), notice: 'コメントが追加されました。' # 保存成功時、詳細ページにリダイレクト
    else
      @prototype = @comment.prototype # コメントに関連するプロトタイプを取得
      @comments = @prototype.comments # プロトタイプに関連するコメントを取得
      render 'prototypes/show', status: :unprocessable_entity # 保存失敗時、詳細ページを再表示
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id]) # ストロングパラメータの設定
  end
end
