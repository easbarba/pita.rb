class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.text :body
      t.string :title
      t.datetime :published_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
