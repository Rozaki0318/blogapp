class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.text :image
      t.timestamps null:true
    end
  end
end
