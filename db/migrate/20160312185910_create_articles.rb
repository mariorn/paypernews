class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true
      t.string :title
      t.text :lead
      t.text :body
      t.float :price, :default => 0.1
      t.integer :visits, :default => 0
      t.float :score, :default => 0
      t.boolean :publish, :default => true

      t.timestamps null: false
    end
  end
end
