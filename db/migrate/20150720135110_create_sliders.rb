class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :logo
      t.boolean :show, default: true

      t.timestamps null: false
    end
  end
end
