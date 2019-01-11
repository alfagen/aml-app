class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :email, null: false
      t.string :name
      t.string :crypted_password
      t.string :salt
      t.string :reset_password_token
      t.datetime :reset_password_token_expires_at
      t.datetime :reset_password_email_sent_at
      t.integer :access_count_to_reset_password_page

      t.timestamps
    end

    add_reference :users, :aml_operator, foreign_key: true
    add_index :users, :email, unique: true

    AML::Operator.find_each do |operator|
      User.create!(email: operator.email, name: operator.name, crypted_password: operator.crypted_password, salt: operator.salt, aml_operator_id: operator.id)
    end
  end

  def down
    drop_table :users
  end
end
