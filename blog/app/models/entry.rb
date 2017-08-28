class Entry < ActiveRecord::Base
  validates		:title, :body, :author_id, { presence: true }
  belongs_to	:author, class_name: "User"
  has_many		:comments
  has_many		:taggings
  has_many		:tags, through: :taggings

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end
end
