class CreateQuadras < ActiveRecord::Migration[5.0]
  def change
    create_table :quadras do |t|
      t.string :descricao
      t.st_polygon :localizacao, geographic: true

      t.timestamps
    end
  end
end
