class CreateNightmares < ActiveRecord::Migration[5.2]
  def change
    create_table :nightmares do |t|
      t.string :title
      t.datetime :date
      t.text :description
      t.string :emotion
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
