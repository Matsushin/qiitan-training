class Articles::Update < ApplicationService
  object :article, default: nil
  string :title, default: ''
  string :body, default: ''
  file :image, default: nil

  def execute
    article.title = title
    article.body = body
    article.image.attach(image) if image?
    errors.merge!(article.errors) unless article.save
    article
  end

  def to_model
    article
  end
end
