class Article < ApplicationRecord
  has_many :comments

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  validates :int_value, presence: true
  validates :str_value, presence: true
  validates :range_value, presence: true
  validates :uniq_value, presence: true
  validates :date_value, presence: true
  validate :after_today

  has_one_attached :image

  def after_today
    # date_valueが今日以降の日付かチェックしてエラーならエラーメッセージをセットする
  end
end