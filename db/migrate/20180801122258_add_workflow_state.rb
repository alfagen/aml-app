# frozen_string_literal: true

class AddWorkflowState < ActiveRecord::Migration[5.2]
  def change
    add_column :client_documents, :workflow_state, :string
  end
end
