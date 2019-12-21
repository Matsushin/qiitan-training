class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_article, only: %i[index create]
  
  def index
    comments = @article.comments.order(created_at: :desc)
    render json: comments.to_json(only: %i[id body created_at])
  end

  def create
    comment = @article.comments.build(comment_params)

    if comment.save
      render json: comment.to_json
    else
      render json: { errors: comment.errors.full_messages }
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end