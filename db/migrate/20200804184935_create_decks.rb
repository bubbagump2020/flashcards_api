class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject

      t.timestamps
    end
  end
end
