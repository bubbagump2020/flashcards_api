class CreateFlashCards < ActiveRecord::Migration[6.0]
  def change
    create_table :flash_cards do |t|
      t.references :deck, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
