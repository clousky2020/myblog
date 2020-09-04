class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :articles_categories, id: false do |t|
      t.integer :article_id
      t.integer :category_id

    end
    add_index :articles_categories, :article_id
    add_index :articles_categories, :category_id
  end
end
