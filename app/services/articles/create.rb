class Articles::Create < ApplicationService
  object :user, default: nil
  string :title, default: ''
  string :body, default: ''
  file :image

  validates :user, presence: true

  def execute
    article = Article.new(inputs)
    errors.merge!(article.errors) unless article.save
    article
  end

  def to_model
    Article.new(inputs)
  end
end