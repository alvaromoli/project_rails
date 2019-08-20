class CreatePostulations < ActiveRecord::Migration[5.2]
  def change
    create_table :postulations do |t|
      t.references :user, foreign_key: true
      t.references :program, foreign_key: true
      t.references :contact, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
