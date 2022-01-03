class AddSimilarToPhrase < ActiveRecord::Migration[5.2]
  def change
    add_column :phrases, :similar, :boolean
  end
end
