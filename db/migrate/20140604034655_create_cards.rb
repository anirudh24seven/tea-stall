class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :poster
      t.integer :count_read
      t.integer :count_liked
      t.string :category
      t.string :image_url

      t.timestamps
    end
  end
end
