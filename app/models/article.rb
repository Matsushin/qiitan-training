class Article < ApplicationRecord
  has_many :comments

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validate :after_today

  has_one_attached :image

  before_validation :before_validation_test, :downcase_str_value
  after_validation :after_validation_test
  before_create :before_create_test
  after_create :after_create_test, :create_comment
  before_save :before_save_test
  after_save :after_save_test

  def after_today
    # date_valueが今日以降の日付かチェックしてエラーならエラーメッセージをセットする
  end

  def before_validation_test
    p '--- before_validation ---'
    self.range_value = range_value.upcase
  end

  def after_validation_test
    p '--- after_validation ---'
  end

  def before_create_test
    p '--- before_create ---'
  end

  def after_create_test
    p '--- after_create ---'
  end

  def before_save_test
    p '--- before_save ---'
  end

  def after_save_test
    p '--- after_save ---'
  end

  def create_comment
    comments.create!(body: '記事コメント')
  end

  def downcase_str_value
    self.str_value = str_value.downcase
  end
end