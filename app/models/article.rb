class Article < ApplicationRecord
  has_many :comments

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  validates :int_value, presence: true, numericality: { only_integer: true, greater_than: 10, less_than_or_equal_to: 20 }
  validates :str_value, presence: true, length: { minimum: 5 }, format: { with: /\A[0-9a-zA-Z]+\z/ }
  validates :range_value, presence: true, inclusion: { in: %w(small medium large) }
  validates :uniq_value, presence: true, uniqueness: true
  validates :date_value, presence: true
  validate :after_today

  has_one_attached :image

  def after_today
    return if date_value >= Date.current
    errors.add(:date_value, 'は今日以降の日付にしてください')
  end
end