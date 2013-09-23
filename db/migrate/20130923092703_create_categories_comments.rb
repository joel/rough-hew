class CreateCategoriesComments < ActiveRecord::Migration
  def change
    create_table(:categories_comments, id: false) do |t|
      t.references :category
      t.references :comment
    end
    add_index(:categories_comments, [ :category_id, :comment_id ])
  end
end
