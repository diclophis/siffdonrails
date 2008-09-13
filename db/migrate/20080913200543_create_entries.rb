class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :position
      t.integer :plan_id
      t.datetime :start_time
      t.string :phase
      t.string :type
      t.string :title
      t.string :description
      t.integer :remote_id

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
