module PracticeHelper

  def map_sample(prefectures)
    # mapメソッドを使って都道府県名の配列を作ろう
    prefectures.map { |pref| pref[:name] }
  end

  def inject_sample(prefectures)
    # injectメソッドを使って各都道府県のcountを集計してみよう
    prefectures.inject(0) { |sum, pref| sum + pref[:count] }
  end

  def join_sample(prefectures)
    # joinメソッドを使って各都道府県の名称(name)をカンマ区切りで繋げてみよう
    map_sample(prefectures).join(',')
  end

  def select_sample(prefectures)
    # selectメソッドを使って人口数(count)が4000000より大きい県名を取得しよう
    prefectures.select do |pref|
      pref[:count] > 4000000
    end.pluck(:name)
  end

  def group_by_sample(prefectures)
    # group_byメソッドを使ってidでグループ分けしてみよう
    prefectures.group_by { |pref| pref[:id] }
  end

  def to_h_sample(prefectures)
    # to_hメソッドを使って都道府県名(name)をキー、countがバリューのHashを作ろう
    prefectures.map do |value|
      [value[:name], value[:count]]
    end.to_h
  end
end