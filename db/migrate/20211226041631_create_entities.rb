class CreateEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :english
      t.string :article
      t.string :german
      t.boolean :done_article
      t.boolean :done_german

      t.timestamps
    end
  end
end
