class CreatePostReadRecords < ActiveRecord::Migration
  def self.up
    create_table :post_read_records do |t|
      t.references :user
      t.references :rss_post

      t.timestamps
    end
  end

  def self.down
    drop_table :post_read_records
  end
end
