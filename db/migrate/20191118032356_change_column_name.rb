class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :body, :content
  end
end
