class EditEventModel < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :lat, :float
    add_column :events, :lng, :float
  end
end
