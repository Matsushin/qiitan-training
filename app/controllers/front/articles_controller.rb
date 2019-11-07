class Front::ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
  end
end