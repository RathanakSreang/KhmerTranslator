class AddTranslateToSliders < ActiveRecord::Migration
  def self.up
    Slider.create_translation_table!({
      title: :string,      
      description: :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Slider.drop_translation_table! :migrate_data => true
  end
end
