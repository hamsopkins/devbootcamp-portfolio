class AddAuthorIdToEntries < ActiveRecord::Migration
  def change
  	add_column :entries, :author_id, :integer
  end
end
