class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.string :cod
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
