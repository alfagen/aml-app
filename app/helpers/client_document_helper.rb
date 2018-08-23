# frozen_string_literal: true

# Стиль active для первоначального открытия на вкладке pending
#
module ClientDocumentHelper
  def document_active_type(workflow_state)
    workflow_state == :pending ? :inclusive : :exact
  end

  def field_value(client_document, field)
    ClientDocumentField.where(client_document: client_document, document_kind_field_definition: field).first
  end
end
