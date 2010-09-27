class AddEditorToWork < ActiveRecord::Migration
  def self.up
    add_column :works, :editor, :string
  end

  def self.down
    remove_column :works, :editor
  end
end
