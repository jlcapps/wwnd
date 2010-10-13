class RemoveActiveFromWorks < ActiveRecord::Migration
  def self.up
    remove_column :works, :active 
  end

  def self.down
    add_column :works, :action, :boolean, :default => false
  end
end
