class CreateRios < ActiveRecord::Migration[5.0]
  def change
    create_table :rios do |t|
      t.string :descricao
      t.line_string :geom, :geographic => true, :srid =>4055 

      t.timestamps
    end
  end
end
