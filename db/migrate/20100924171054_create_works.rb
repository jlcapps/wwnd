class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.string :title
      t.string :as_by
      t.integer :author_id
      t.string :translator
      t.string :source
      t.boolean :active, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
