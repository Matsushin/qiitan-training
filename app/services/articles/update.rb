class Articles::Update < ApplicationService
  object :article, default: nil
  string :title, default: ''
  string :body, default: ''
  file :image, default: nil
  hash :tags_attributes, strip: false

  def execute
    article.title = title
    article.body = body
    article.image.attach(image) if image?
    article.tags_attributes = tags_attributes
    errors.merge!(article.errors) unless article.save
    article
  end

  def to_model
    article
  end
end
