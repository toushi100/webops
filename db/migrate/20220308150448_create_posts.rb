class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :author
      t.integer :tags
      t.integer :comments

      t.timestamps
    end
  end
end
