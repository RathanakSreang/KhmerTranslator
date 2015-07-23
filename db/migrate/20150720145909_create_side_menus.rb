class CreateSideMenus < ActiveRecord::Migration
  def change
    create_table :side_menus do |t|
      t.string :title
      t.string :image
      t.string :link
      t.boolean :show, default: true

      t.timestamps null: false
    end
  end
end
