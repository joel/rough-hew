class CreateComments < ActiveRecord::Migration

  def up
    unless table_exists?(:comments)
      create_table :comments do |t|
        t.references :post
        t.text :content
        t.timestamps
      end
      say_with_time "extract comments (#{Post.count} posts)" do
        Post.select([:id, :comment]).where('comment IS NOT NULL').find_each do |post|
          post.comments.create!({ content: post.attributes['comment'] })
        end
      end
    end
    remove_column :posts, :comment if column_exists?(:posts, :comment)
  end

  def down
    drop_table :comments if table_exists?(:comments)
    add_column :posts, :comment, :text unless column_exists?(:posts, :comment)
  end

end
