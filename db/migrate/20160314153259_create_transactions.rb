class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true
      t.references :article, index: true
      t.timestamps null: false
    end
  end
end
