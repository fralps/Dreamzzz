class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :introduction
      t.text :first_paragraph
      t.text :second_paragraph
      t.string :first_subtitle
      t.text :third_paragraph
      t.text :fourth_paragraph
      t.text :fifth_paragraph
      t.string :second_subtitle
      t.text :sixth_paragraph
      t.integer :like
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
