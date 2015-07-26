class AddTranslateToSideMenus < ActiveRecord::Migration
  def self.up
    SideMenu.create_translation_table!({
      title: :string      
    }, {
      :migrate_data => true
    })
  end

  def self.down
    SideMenu.drop_translation_table! :migrate_data => true
  end
end
