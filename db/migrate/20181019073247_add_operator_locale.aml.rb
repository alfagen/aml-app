# This migration comes from aml (originally 20181019065150)
class AddOperatorLocale < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_operators, :locale, :string, default: I18n.default_locale
    execute "update aml_operators set locale='#{I18n.default_locale}'"
    change_column_null :aml_operators, :locale, false
  end
end
