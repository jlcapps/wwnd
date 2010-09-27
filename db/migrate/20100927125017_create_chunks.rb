class CreateChunks < ActiveRecord::Migration
  def self.up
    create_table :chunks do |t|
      t.string :title
      t.text :body
      t.integer :work_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chunks
  end
end
