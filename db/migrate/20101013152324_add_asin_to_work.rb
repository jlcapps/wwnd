class AddAsinToWork < ActiveRecord::Migration
  def self.up
    add_column :works, :asin, :string
  end

  def self.down
    remove_column :works, :asin
  end
end
