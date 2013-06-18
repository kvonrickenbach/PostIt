class CreateCategorizations < ActiveRecord::Migration
  def up
  	create_table :categorizations do |t|
      t.integer :user_id, :category_id
      t.timestamps
    end
  end

  def down
    drop_table :categorizations
  end
end
