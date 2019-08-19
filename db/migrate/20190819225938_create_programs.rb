class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.integer :program_type
      t.integer :status

      t.timestamps
    end
  end
end
