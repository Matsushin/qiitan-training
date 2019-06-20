class Articles::Update < ApplicationService
  object :article, default: nil
  string :title, default: ''
  string :body, default: ''

  validates :title, presence: true
  validates :body, presence: true

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
