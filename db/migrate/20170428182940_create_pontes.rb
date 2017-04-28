class CreatePontes < ActiveRecord::Migration[5.0]
  def change
    create_table :pontes do |t|
      t.line_string :geom, :geographic => true, :srid => 4055

      t.timestamps
    end
  end
end
