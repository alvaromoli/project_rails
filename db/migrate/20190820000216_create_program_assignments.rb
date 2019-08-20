class CreateProgramAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :program_assignments do |t|
      t.references :user, foreign_key: true
      t.references :program, foreign_key: true
      t.integer :status
      t.integer :assign_value

      t.timestamps
    end
  end
end
