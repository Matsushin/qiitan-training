class Search::Articles < ApplicationService
  object :records, default: nil, class: ActiveRecord::Relation
  string :title, default: nil
  string :body, default: nil
  string :comment_body, default: nil

  symbol :order_by, default: :created_at

  enumerize :order_by, in: %i(id title body created_at updated_at)

  symbol :order_direction, default: :desc

  def execute
    articles = (records || Article.all)
    articles = articles.where('articles.title like ?', "%#{title}%") if title.present?
    articles = articles.where('articles.body like ?', "%#{body}%") if body.present?
    articles = articles.joins(:comments).where('comments.body like ?', "%#{comment_body}%").distinct if comment_body.present?
    articles.order(order_by => order_direction)
  end
end
