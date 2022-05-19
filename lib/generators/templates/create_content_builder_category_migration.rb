class CreateContentBuilderCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :content_builder_categories do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
