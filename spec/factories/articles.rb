FactoryBot.define do
  factory :article do
    title { '記事タイトル' }
    body { '記事本文' }
    int_value { 15 }
    str_value { 'testtest' }
    range_value { 'small' }
    sequence(:uniq_value) { |n| "test#{n}" }
    date_value { Date.current }
    user
  end
end
