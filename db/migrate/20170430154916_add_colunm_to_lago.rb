class AddColunmToLago < ActiveRecord::Migration[5.0]
  def change
    add_column :lagos, :descricao, :string
  end
end
