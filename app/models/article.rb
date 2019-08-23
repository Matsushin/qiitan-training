class Article < ApplicationRecord
  has_many :comments

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  has_one_attached :image
end