class Articles::Create < ApplicationService
  string :title, default: ''
  string :body, default: ''

  validates :title, presence: true
  validates :body, presence: true

  def execute
    article = Article.new(inputs)
    errors.merge!(article.errors) unless article.save
    article
  end

  def to_model
    Article.new(inputs)
  end
end