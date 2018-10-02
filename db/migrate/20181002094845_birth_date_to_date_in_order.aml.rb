# This migration comes from aml (originally 20181002083626)
class BirthDateToDateInOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :aml_orders, :birth_date, :date
  end
end
