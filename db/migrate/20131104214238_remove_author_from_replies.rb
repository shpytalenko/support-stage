class RemoveAuthorFromReplies < ActiveRecord::Migration
  def up
    remove_column :replies, :author
  end

  def down
    add_column :replies, :author, :string
  end
end
