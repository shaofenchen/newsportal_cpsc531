class ChangeDescriptionAndSummaryToTextInArticles < ActiveRecord::Migration
  def up
	change_column :articles, :description, :text
	change_column :articles, :summary, :text
  end

  def down
	change_column :articles, :description, :string
	change_column :articles, :summary, :string
  end
end
