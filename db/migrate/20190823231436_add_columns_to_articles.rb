class AddColumnsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :int_value, :integer
    add_column :articles, :str_value, :string
    add_column :articles, :range_value, :string
    add_column :articles, :uniq_value, :string
    add_column :articles, :date_value, :date
  end
end
