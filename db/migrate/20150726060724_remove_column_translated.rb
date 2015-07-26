class RemoveColumnTranslated < ActiveRecord::Migration
  def change
    remove_column :pages, :title
    remove_column :pages, :name
    remove_column :pages, :content
    remove_column :sliders, :title
    remove_column :sliders, :description
    remove_column :side_menus, :title
  end
end
