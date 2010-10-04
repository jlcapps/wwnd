class AddSlugIndexToAuthorsTable < ActiveRecord::Migration
  def self.up
    add_index "authors", "slug"
  end

  def self.down
    remove_index "authors", "slug"
  end
end
