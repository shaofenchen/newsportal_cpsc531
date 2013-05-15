class Source < ActiveRecord::Base
  attr_accessible :category, :description, :name, :source_link, :source_type, :user_id
end
