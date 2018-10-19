# This migration comes from aml (originally 20181019065150)
class AddOperatorLocale < ActiveRecord::Migration[5.2]
    add_column :aml_operators, :locale, :string, default: 'ru', null: false
    execute "update aml_operators set locale='ru'"
  end
end
