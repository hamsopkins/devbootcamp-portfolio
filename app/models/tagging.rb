class Tagging < ActiveRecord::Base
  validates :entry_id, presence: true
  validates :tag_id, presence: true
  belongs_to :tag, foreign_key: :tag_id
  belongs_to :entry, foreign_key: :entry_id
end
