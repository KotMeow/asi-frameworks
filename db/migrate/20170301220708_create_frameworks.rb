class CreateFrameworks < ActiveRecord::Migration[5.0]
  def change
    create_table :frameworks do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :category
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
