require 'feedzirra'
require 'rjb'
class Article < ActiveRecord::Base
  attr_accessible :category, :retrieve_date, :source, :source_link, :title, :user_id, :author, :entry_url, :description, :summary, :published_time, :last_modified_time
  
  @@java_root = "#{Rails.root}/lib/java"
  Rjb::load("#{@@java_root}/dm.jar", ['-Xms512M', '-Xmx1024M'])
  @@tc_class = Rjb::import('cpsc531.tc.TextCategorization')
  
  @@tc_class.init("#{@@java_root}/dict", "#{@@java_root}/model/matrix.txt","#{@@java_root}/model/wordList.txt","#{@@java_root}/model/df.txt")
  
  def self.import(feed_str)
    feed = Feedzirra::Feed.fetch_and_parse(feed_str)
    feed.entries.each do |entry|
      # Find or create the screencast data into our database
      record = Article.where(title: entry.title).first_or_create(
		source:				feed.title,
		source_link:  		feed.url,
        title:      		entry.title,
		retrieve_date: 		Time.now,
        summary:    		entry.summary,
        description:     	entry.content,
        entry_url:         	entry.url,
		author:				entry.author,
        published_time: 	entry.published
      )
	  if record.category.nil? then
		text = record.description.nil? ? record.summary : record.description
		unless text.nil?
			record.category = @@tc_class.classify(record.title, text)
			record.save
		end
	  end
    end
  end
end
