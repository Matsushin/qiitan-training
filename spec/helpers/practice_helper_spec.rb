require 'rails_helper'

RSpec.describe PracticeHelper, type: :helper do
  let(:prefectures) do
    [
        { id: 1, name: '北海道', count: 5285430 },
        { id: 2, name: '青森県', count: 1262686 },
        { id: 2, name: '岩手県', count: 1240522 },
        { id: 2, name: '宮城県', count: 2313215 }
    ]
  end

  describe '#map_sample' do
    subject { helper.map_sample(prefectures) }
    it { is_expected.to eq ['北海道', '青森県', '岩手県', '宮城県'] }
  end

  describe '#inject_sample' do
    subject { helper.inject_sample(prefectures) }
    it { is_expected.to eq 10101853 }
  end

  describe '#join_sample' do
    subject { helper.join_sample(prefectures) }
    it { is_expected.to eq '北海道,青森県,岩手県,宮城県' }
  end

  describe '#select_sample' do
    subject { helper.select_sample(prefectures) }
    it { is_expected.to eq ['北海道'] }
  end

  describe '#group_by_sample' do
    subject { helper.group_by_sample(prefectures) }
    it do
      is_expected.to eq(
       {
           1 => [{ count: 5285430, id: 1, name: "北海道" }],
           2 => [{ count: 1262686, id: 2, name: "青森県"},
                 { count: 1240522, id: 2, name: "岩手県"},
                 { count: 2313215, id: 2, name: "宮城県"}]
       }
     )
    end
  end

  describe '#to_h_sample' do
    subject { helper.to_h_sample(prefectures) }
    it { is_expected.to eq({ '北海道' => 5285430, '青森県' => 1262686, '岩手県' => 1240522, '宮城県' => 2313215 }) }
  end
end