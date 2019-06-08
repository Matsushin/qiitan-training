class ArticlesController < ApplicationController

  def index
   @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    inputs = params.fetch(:article, {})
    outcome = Articles::Create.run(inputs)
    if outcome.valid?
      redirect_to articles_path, notice: '登録しました。'
    else
      @article = outcome
      flash.now[:alert] = "登録に失敗しました。#{@article.errors.full_messages.join('。')}"
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end