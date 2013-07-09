class AddFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.timestamps
      t.references :user
    end

    create_table :feed_sources do |t|
      t.timestamps
      t.references :user
      t.references :feed
    end
  end
end
