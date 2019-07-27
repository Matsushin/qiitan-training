class Articles::Create < ApplicationService
  string :title, default: ''
  string :body, default: ''

  def execute
    article = Article.new(inputs)
    errors.merge!(article.errors) unless article.save
    article
  end

  def to_model
    Article.new(inputs)
  end
end