class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :match, null: false, foreign_key: true
      t.integer :winner_id
      t.integer :loser_id
      t.boolean :draw
      t.string :score

      t.timestamps
    end
  end
end
