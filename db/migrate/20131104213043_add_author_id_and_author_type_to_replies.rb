class AddAuthorIdAndAuthorTypeToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :author_id, :integer
    add_column :replies, :author_type, :string
  end
end
