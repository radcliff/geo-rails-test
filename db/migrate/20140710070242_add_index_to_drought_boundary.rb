class AddIndexToDroughtBoundary < ActiveRecord::Migration
  def change
    change_table :droughts do |t|
      t.index :boundary, :spatial => true
    end
  end
end
