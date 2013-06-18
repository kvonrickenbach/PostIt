class Editcategorizationids < ActiveRecord::Migration
  def change
    add_column :categorizations, :post_id, :integer
    remove_column :categorizations, :user_id
  end
end
