class Api::V1::ArticlesController < Api::V1::ApplicationController
  before_action :set_article, only: %i[update show destroy]
  
  def index
    articles = Article.all.order(created_at: :desc).page(params[:page]).per(10)
    render json: articles.to_json(only: %i[id title], methods: %i[short_body author_email comment_count created_on])
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: article.to_json
    else
      render json: { errors: article.errors.full_messages }
    end
  end

  def update
    if @article.update(article_params)
      render json: @article.to_json
    else
      render json: { errors: @article.errors.full_messages }
    end
  end

  def show
    render json: @article.to_json(include: [tags: { only: %i[name]}], methods: %i[author_email comment_count image_url])
  end

  def destroy
    if @article.destroy
      render json: @article.to_json
    else
      render json: { errors: @article.errors.full_messages, status: :unprocessable_entity }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :user_id, tags_attributes: %i[id name display_order _destroy])
  end
end