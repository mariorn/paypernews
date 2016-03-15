class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :name
      t.string      :last_name
      t.string      :alias
      t.string      :email
      t.string      :nif
      t.integer     :phone
      t.string      :genre
      t.string      :location
      t.integer     :credit_card
      t.text        :biography
      t.string      :avatar
      t.float       :score, :default => 0
      t.boolean     :admin, :default => false
      t.timestamps null: false
    end
  end
end
