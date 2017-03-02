class AddUrlToFramework < ActiveRecord::Migration[5.0]
  def change
      add_column :frameworks, :url, :string
  end
end
