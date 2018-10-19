# This migration comes from aml (originally 20181019065150)
class AddOperatorLocale < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_operators, :locale, :string, default: 'ru'
    execute "update aml_operators set locale='ru'"
    change_column_null :aml_operators, :locale, false
  end
end
