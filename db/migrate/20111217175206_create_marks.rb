class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :book_id
      t.string :page
      t.string :note

      t.timestamps
    end
  end
end
