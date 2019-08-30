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

    context 'int_value' do
      context '空の場合' do
        let(:article) { build(:article, user: user, int_value: nil) }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:int_value]).to include 'を入力してください'
        end
      end

      context '文字列が入力された場合' do
        let(:article) { build(:article, user: user, int_value: 'test') }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:int_value]).to include 'は数値で入力してください'
        end
      end

      context '10が入力された場合' do
        let(:article) { build(:article, user: user, int_value: 10) }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:int_value]).to include 'は10より大きい値にしてください'
        end
      end

      context '11が入力された場合' do
        let(:article) { build(:article, user: user, int_value: 11) }
        it 'バリデーションが通る' do
          expect(article).to be_valid
        end
      end

      context '21が入力された場合' do
        let(:article) { build(:article, user: user, int_value: 21) }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:int_value]).to include 'は20以下の値にしてください'
        end
      end

      context '20が入力された場合' do
        let(:article) { build(:article, user: user, int_value: 20) }
        it 'バリデーションが通る' do
          expect(article).to be_valid
        end
      end
    end

    context 'str_value' do
      context '文字数が少ない場合' do
        let(:article) { build(:article, user: user, str_value: 'test') }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:str_value]).to include 'は5文字以上で入力してください'
        end
      end

      context '文字に記号が含まれている場合' do
        let(:article) { build(:article, user: user, str_value: 'testtest@_-') }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:str_value]).to include 'は不正な値です'
        end
      end

      context '文字が半角英数字のみの場合' do
        let(:article) { build(:article, user: user, str_value: '12345789abcxyzABCXYZ') }
        it 'バリデーションが通る' do
          expect(article).to be_valid
        end
      end
    end

    context 'range_value' do
      context '値が一覧にない場合' do
        let(:article) { build(:article, user: user, range_value: 'test') }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:range_value]).to include 'は一覧にありません'
        end
      end

      context '値が一覧にある場合' do
        let(:article) { build(:article, user: user, range_value: %w(small medium large).sample) }
        it 'バリデーションが通る' do
          expect(article).to be_valid
        end
      end
    end

    context 'uniq_value' do
      let!(:article) { create(:article, user: user, uniq_value: 'test') }
      let(:article2) { build(:article, user: user, uniq_value: uniq_value) }
      context '値が重複する場合' do
        let!(:uniq_value) { 'test' }
        it 'バリデーションが通らない' do
          expect(article2).to_not be_valid
          expect(article2.errors.messages[:uniq_value]).to include 'はすでに存在します'
        end
      end

      context '値が重複しない場合' do
        let!(:uniq_value) { 'test2' }
        it 'バリデーションが通る' do
          expect(article2).to be_valid
        end
      end
    end

    context 'date_value' do
      context '日付が昨日の場合' do
        let(:article) { build(:article, user: user, date_value: Date.current.yesterday) }
        it 'バリデーションが通らない' do
          expect(article).to_not be_valid
          expect(article.errors.messages[:date_value]).to include 'は今日以降の日付にしてください'
        end
      end

      context '日付が今日の場合' do
        let(:article) { build(:article, user: user, date_value: Date.current) }
        it 'バリデーションが通る' do
          expect(article).to be_valid
        end
      end
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
      # TODO: ここにテストコードを書く
    end
  end
end
