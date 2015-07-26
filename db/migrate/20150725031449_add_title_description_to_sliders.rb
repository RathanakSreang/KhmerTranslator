class AddTitleDescriptionToSliders < ActiveRecord::Migration
  def change
    add_column :sliders, :title, :string
    add_column :sliders, :description, :text
  end
end
