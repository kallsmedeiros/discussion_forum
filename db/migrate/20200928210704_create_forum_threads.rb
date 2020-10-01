class CreateForumThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_threads do |t|
      t.text :text
      t.integer :level, default: 0
      t.integer :parent_id

      t.timestamps
    end
  end
end
