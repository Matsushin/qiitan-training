class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :article_id, index: true, foreign_key: true
      t.string :name, null: false
      t.integer :display_order

      t.timestamps null: false
    end
  end
end
