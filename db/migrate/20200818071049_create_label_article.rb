class CreateLabelArticle < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_labels, id: false do |t|
      t.integer :article_id
      t.integer :label_id

    end
    add_index :articles_labels, :article_id
    add_index :articles_labels, :label_id
  end
end
