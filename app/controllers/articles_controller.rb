class ArticlesController < ApplicationController

  def index
   @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: '登録しました。'
    else
      flash[:alert] = '登録に失敗しました。'
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end