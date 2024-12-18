class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user).all
    # includesを追加してN+1問題を回避
  end

  def show
    @prototype = Prototype.find(params[:id])  # まずプロトタイプを検索
    @user = @prototype.user                   # プロトタイプに紐づくユーザーを取得
    @prototypes = @user.prototypes            # そのユーザーの全プロトタイプを取得
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
  end

  def edit
    # ここに投稿者以外のアクセス制御が入ります
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'プロトタイプが正常に更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id]) # IDをもとにプロトタイプを取得
    @prototype.destroy # プロトタイプを削除
    redirect_to root_path, notice: 'プロトタイプが削除されました。' # トップページにリダイレクト
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def authorize_user
    return if user_signed_in? && @prototype.user_id == current_user.id

    redirect_to action: :index, alert: 'このプロトタイプの編集権限がありません。'
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
