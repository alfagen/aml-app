# This migration comes from aml (originally 20181107103305)
class CreateAMLAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :aml_agreements do |t|
      t.string :url
      t.timestamp :archived_at

      t.timestamps
    end
    AML::Agreement.create_translation_table! title: :string, details: :text
  end
end
