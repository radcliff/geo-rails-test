class CreateDroughts < ActiveRecord::Migration
  def change
    create_table :droughts do |t|
      t.integer :objectid
      t.integer :dm
      t.float :shape_leng
      t.float :shape_area
      t.multi_polygon :boundary, :srid => 4326

      t.timestamps
    end
  end
end
