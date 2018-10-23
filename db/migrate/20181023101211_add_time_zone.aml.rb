# This migration comes from aml (originally 20181023094131)
class AddTimeZone < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_operators, :time_zone, :string
  end
end
