require 'rails_helper'

RSpec.describe Article do
  let(:user) { create(:user) }
  describe '#valid?' do
    subject { article.valid? }
    context 'タイトルが空の場合' do
      let(:article) { build(:article, user: user, title: nil, body: '記事本文') }
      it { expect(article).to_not be_valid }
    end

    context '本文が空の場合' do
      let(:article) { build(:article, user: user, title: '記事タイトル', body: nil) }
      it { expect(article).to_not be_valid }
    end

    context 'タイトルと本文が入力されている場合' do
      let(:article) { build(:article, user: user, title: '記事タイトル', body: '記事本文') }
      it { expect(article).to be_valid }
    end
  end

  describe '#create_comment' do
    let(:article) { build(:article, user: user) }
    before { article.save }
    it 'コメントレコードが作成されている' do
      expect(article.comments.count).to eq 1
      expect(article.comments.first.body).to eq '記事コメント'
    end
  end

  describe '#downcase_str_value' do
    let(:article) { build(:article, user: user, str_value: 'TEST') }
    before { article.save }
    it 'str_valueがtestとなっている' do
      expect(article.str_value).to eq 'test'
    end
  end
end
