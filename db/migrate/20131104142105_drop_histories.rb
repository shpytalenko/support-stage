class DropHistories < ActiveRecord::Migration
  def up
    drop_table :histories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
