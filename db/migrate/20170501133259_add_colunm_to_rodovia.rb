class AddColunmToRodovia < ActiveRecord::Migration[5.0]
  def change
    add_column :rodovia, :descricao, :string
  end
end
