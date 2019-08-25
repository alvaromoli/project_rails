class AddPeriodAndDepartmentToProgram < ActiveRecord::Migration[5.2]
  def change
    add_reference :programs, :period, foreign_key: true
    add_reference :programs, :department, foreign_key: true
  end
end
