class CreateTableCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :table_categories do |t|
      t.string :category
    end
  end
end
