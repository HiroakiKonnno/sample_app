class ArticleController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :edit]

  def index
    @articles = Article.where(user_id: current_user.id)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @user = User.find(params[:user_id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to user_article_index_path
    else
      flash[:danger] = '新規作成に失敗しました。'
      redirect_to new_user_article_path
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = '更新に成功しました。'
      redirect_to user_article_index_path
    else
      flash[:danger] = '更新に失敗しました。'
      redirect_to edit_user_article_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "データを削除しました。"
    redirect_to user_article_index_url
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :user_id)
  end

  
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "ログインしてください。"
      redirect_to root_path
    end
  end
end
