class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to new_article_path, notice: '登録しました。'
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end