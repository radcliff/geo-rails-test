class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.integer :zip
      t.polygon :boundary, :srid => 2285

      t.timestamps
    end
  end
end
