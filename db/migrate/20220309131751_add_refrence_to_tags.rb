class AddRefrenceToTags < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :tags, foreign_key: true 

  end
end
