class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.references :user, null: false
      t.string :title
      t.string :isbn
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
