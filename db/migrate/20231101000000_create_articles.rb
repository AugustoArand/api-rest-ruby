class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :published, default: false

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :published
  end
end
