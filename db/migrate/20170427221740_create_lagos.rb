class CreateLagos < ActiveRecord::Migration[5.0]
  def change
    create_table :lagos do |t|
      t.st_polygon :geom, :geographic => true, :srid => 4055

      t.timestamps
    end
  end
end
