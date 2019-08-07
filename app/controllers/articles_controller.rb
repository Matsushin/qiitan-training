class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def index
   @articles_search = Search::Articles.run(params.fetch(:search_articles, {}))
   if @articles_search.valid?
     @articles = @articles_search.result.page(params[:page])
   else
     flash.now[:alert] = '指定の検索が動作しませんでした。'
     @articles = Article.all.order(created_at: :desc).page(params[:page])
   end
  end

  def new
    @article = Article.new
  end

  def create
    inputs = params.fetch(:article, {}).merge(user: current_user)
    outcome = Articles::Create.run(inputs)
    if outcome.valid?
      redirect_to articles_path, notice: '登録しました。'
    else
      @article = outcome
      flash.now[:alert] = "登録に失敗しました。#{@article.errors.full_messages.join('。')}"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    inputs = params.fetch(:article, {}).merge(article: @article)
    outcome = Articles::Update.run(inputs)
    if outcome.valid?
      redirect_to articles_path, notice: '更新しました。'
    else
      @article = outcome
      flash.now[:alert] = "更新に失敗しました。\n#{@article.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  def show
  end

  def destroy
    outcome = Articles::Delete.run(article: @article)
    if outcome.valid?
      redirect_to articles_path, notice: '削除しました'
    else
      redirect_to articles_path, alert: "削除に失敗しました。#{outcome.errors.full_messages.join('。')}"
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end