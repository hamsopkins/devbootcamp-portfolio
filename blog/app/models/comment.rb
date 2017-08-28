class Comment < ActiveRecord::Base
	validates :body, presence: true
	validates :author_id, presence: true
	validates :entry_id, presence: true
	belongs_to :author, class_name: "User"
	belongs_to :entry
end
