class CreateRodovia < ActiveRecord::Migration[5.0]
  def change
    create_table :rodovia do |t|
      t.line_string :geom

      t.timestamps
    end
  end
end
