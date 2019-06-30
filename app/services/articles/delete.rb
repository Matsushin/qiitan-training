class Articles::Delete < ApplicationService
  object :article, default: nil

  def execute
    errors.merge!(article.errors) unless article.destroy
    article
  end
end
