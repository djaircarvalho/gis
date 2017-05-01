class AddColunmToEstrada < ActiveRecord::Migration[5.0]
  def change
    add_column :estradas, :descricao, :string
  end
end
