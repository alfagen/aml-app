# This migration comes from aml (originally 20181222135949)
class PaymentCardLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :aml_payment_cards, :card_bin, :string, limit: 8
  end
end
