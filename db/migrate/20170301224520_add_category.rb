class AddCategory < ActiveRecord::Migration[5.0]
  def change
      remove_column :frameworks, :type
      add_column :frameworks, :category, :string
  end
end
