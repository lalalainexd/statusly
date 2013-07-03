class AddStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.timestamps
      t.text :text, null: false
      t.references :user
    end

  end
end
