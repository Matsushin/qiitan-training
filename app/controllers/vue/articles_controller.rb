class Vue::ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show; end

  def new; end
end