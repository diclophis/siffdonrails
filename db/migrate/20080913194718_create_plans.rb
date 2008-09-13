class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.integer :person_id
      t.string  :title
      t.datetime :start_time

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
