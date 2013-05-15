class AddSummaryDescriptionEntryUrlImgLinkLastModifiedPublishedDateAuthorToArticles < ActiveRecord::Migration
  def change
	add_column :articles, :summary, :string
	add_column :articles, :description, :string
	add_column :articles, :entry_url, :string
	add_column :articles, :author, :string
	add_column :articles, :last_modified_time, :datetime
	add_column :articles, :published_time, :datetime
  end
end