class RemoveDescriptionFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :description, :text
  end
end
