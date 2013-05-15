class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :source
      t.string :source_link
      t.string :category
      t.datetime :retrieve_date
      t.integer :user_id

      t.timestamps
    end
  end
end
