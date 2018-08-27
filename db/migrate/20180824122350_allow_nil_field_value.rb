class AllowNilFieldValue < ActiveRecord::Migration[5.2]
  def change
    change_column_null :client_document_fields, :value, true
  end
end
