class AddStateToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :workflow_state, :string, null: false, default: 'unblocked'
  end
end
