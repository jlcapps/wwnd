class AddYearToWork < ActiveRecord::Migration
  def self.up
    add_column :works, :year, :string
  end

  def self.down
    remove_column :works, :year
  end
end
