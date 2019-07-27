class Articles::Update < ApplicationService
  object :article, default: nil
  string :title, default: ''
  string :body, default: ''

  def execute
    article.title = title
    article.body = body
    errors.merge!(article.errors) unless article.save
    article
  end

  def to_model
    article
  end
end
