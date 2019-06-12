class AddingDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :description, :text
  end
end
