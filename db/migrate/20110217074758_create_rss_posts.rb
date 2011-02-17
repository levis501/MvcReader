class CreateRssPosts < ActiveRecord::Migration
  def self.up
    create_table :rss_posts do |t|
      t.title :string
      t.link :string
      t.description :string
      t.date :datetime
      t.rss_feed :references

      t.timestamps
    end
  end

  def self.down
    drop_table :rss_posts
  end
end
