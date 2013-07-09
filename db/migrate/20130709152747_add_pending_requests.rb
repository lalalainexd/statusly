class AddPendingRequests < ActiveRecord::Migration
  def change
    create_table :pending_requests do |t|
      t.timestamps
      t.references :user
      t.references :requestor
    end
  end
end
