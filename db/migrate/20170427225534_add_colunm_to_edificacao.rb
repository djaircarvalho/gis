class AddColunmToEdificacao < ActiveRecord::Migration[5.0]
  def change
    add_column :edificacaos, :descricao, :string
  end
end
