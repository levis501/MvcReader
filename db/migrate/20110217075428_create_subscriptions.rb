class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.User :references
      t.RSSFeed :references

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
