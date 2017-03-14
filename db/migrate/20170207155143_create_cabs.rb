class CreateCabs < ActiveRecord::Migration[5.0]
  def change
    create_table :cabs do |t|
    	t.string :color
    	t.boolean :availability
    	t.references :location
      t.timestamps
    end
  end
end
