class Tagging < ActiveRecord::Base
  validates :entry_id, presence: true
  validates :tag_id, presence: true
  belongs_to :tag
  belongs_to :entry
end
