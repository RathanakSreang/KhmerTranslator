class AddShowToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title, :string
    add_column :pages, :show, :boolean, default: true
  end
end
