# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.transaction do
  # Article
  5.times do |article_count|
    title = "テスト記事#{article_count + 1}"
    body = "記事内容#{article_count + 1}"
    article = Article.new(title: title, body: body)
    article.save!

    # Comment
    2.times do |comment_count|
      article.comments.create!(body: "#{title}のコメント#{comment_count + 1}")
    end
  end
end