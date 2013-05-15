class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :source_type
      t.string :name
      t.string :source_link
      t.integer :user_id
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
