class OrderDefaultState < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :workflow_state, :string, default: :none
  end
end
