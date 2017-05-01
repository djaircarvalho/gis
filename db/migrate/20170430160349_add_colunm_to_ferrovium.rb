class AddColunmToFerrovium < ActiveRecord::Migration[5.0]
  def change
    add_column :ferrovia, :descricao, :string
  end
end
