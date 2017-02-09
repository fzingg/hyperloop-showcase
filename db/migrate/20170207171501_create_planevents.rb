class CreatePlanevents < ActiveRecord::Migration[5.0]
	def change
	    create_table :planevents do |t|
	      t.string :planeventtitle
	      t.text :description
	      t.timestamps
	    end
	  end
end
