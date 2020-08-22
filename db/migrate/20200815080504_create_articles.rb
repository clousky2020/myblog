class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.integer :views, default: 0
      t.timestamps
    end
  end
end
