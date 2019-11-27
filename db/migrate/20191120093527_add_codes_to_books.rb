class AddCodesToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :codes, :string
  end
end
