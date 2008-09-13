class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :plan_id
      t.integer :person_id
      t.string :status, :default => :yes

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
