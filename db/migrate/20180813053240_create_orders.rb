class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :surname, null: false
      t.string :patronymic, null: false
      t.datetime :birth_date, null: false
      t.string :workflow_state, null: false, default: 'pending'

      t.timestamps
    end
  end
end
