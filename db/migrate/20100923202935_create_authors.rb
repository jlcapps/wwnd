class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name
      t.string :display_name
      t.text :bio
      t.string :slug
      t.boolean :active, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end
end
