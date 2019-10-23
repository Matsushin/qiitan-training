class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    articles = Article.all.page(params[:page]).per(10)
    render json: articles.to_json(only: %i[id title], methods: %i[short_body author_email comment_count created_on])
  end
end