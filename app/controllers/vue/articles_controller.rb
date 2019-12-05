class Vue::ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit]

  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show; end

  def new; end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end