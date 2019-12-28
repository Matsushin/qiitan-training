class Article < ApplicationRecord
  has_many :comments
  has_many :tags, -> { order('display_order ASC') }, dependent: :destroy, inverse_of: :article
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  belongs_to :user

  delegate :email, to: :user, prefix: :author

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
    self.range_value = range_value.upcase if range_value.present?
  end

  def after_validation_test
  end

  def before_create_test
  end

  def after_create_test
  end

  def before_save_test
  end

  def after_save_test
  end

  def create_comment
    comments.create!(body: '記事コメント')
  end

  def downcase_str_value
    self.str_value = str_value.downcase
  end

  def short_body
    body.truncate(20)
  end

  def comment_count
    comments.count
  end

  def created_on
    created_at.to_date
  end

  def image_url
    return unless image.attached?
    path = Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
    "http://localhost:3000#{path}"
  end
end