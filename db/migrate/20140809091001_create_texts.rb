class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :titel
      t.text :text
      t.references :project, index: true

      t.timestamps
    end
  end
end
