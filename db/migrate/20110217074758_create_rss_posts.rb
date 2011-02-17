class CreateRssPosts < ActiveRecord::Migration
  def self.up
    create_table :rss_posts do |t|
      t.string :title
      t.string :link
      t.string :description
      t.datetime :date
      t.references :rss_feed

      t.timestamps
    end
  end

  def self.down
    drop_table :rss_posts
  end
end
