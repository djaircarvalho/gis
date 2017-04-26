class CreateLogradouros < ActiveRecord::Migration[5.0]
  def change
    create_table :logradouros do |t|
      t.string :descricao
      t.st_polygon :localizacao, :geographic => true, :srid => 4055

      t.timestamps
    end
  end
end
