class AddColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :difficulty, :integer
  end
end
