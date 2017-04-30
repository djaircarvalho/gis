class AddColunmToRio < ActiveRecord::Migration[5.0]
  def change
    add_column :rios, :descricao, :string
  end
end
