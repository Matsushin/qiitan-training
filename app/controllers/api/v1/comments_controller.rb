class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    comments = Comment.all.page(params[:page]).per(10)
    render json: comments.to_json(only: %i[id body], include: [article: { only: :title }])
  end
end