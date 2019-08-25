class AddNewAttributesToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :ident_type, :integer
    add_column :contacts, :ident_cod, :string
    add_column :contacts, :gender, :string
    add_column :contacts, :birth_date, :date
    add_column :contacts, :avatar, :string
    add_column :contacts, :names, :string
    add_column :contacts, :lastnames, :string
    add_column :contacts, :civil_status, :string
    add_column :contacts, :phone, :string
    add_column :contacts, :address, :string
    add_column :contacts, :country, :string
    add_column :contacts, :city, :string
  end
end
