class Vue::CommentsController < ApplicationController
  before_action :set_article, only: %i[index new]

  def index; end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end