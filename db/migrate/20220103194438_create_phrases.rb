class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.string :german
      t.string :english
      t.string :category

      t.timestamps
    end
  end
end
