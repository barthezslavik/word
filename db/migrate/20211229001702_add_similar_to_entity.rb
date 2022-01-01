class AddSimilarToEntity < ActiveRecord::Migration[5.2]
  def change
    add_column :entities, :similar, :boolean
  end
end
