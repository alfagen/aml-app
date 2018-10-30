class UserAuth < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_token_expires_at, :datetime
    add_column :users, :reset_password_email_sent_at, :datetime
    add_column :users, :access_count_to_reset_password_page, :integer
  end
end
