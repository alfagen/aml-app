# frozen_string_literal: true

# Стиль active для первоначального открытия на вкладке pending
#
module ClientDocumentHelper
  def document_active_type(workflow_state)
    workflow_state == :pending ? :inclusive : :exact
  end

  def definition_value(client_document, definition)
    definition.client_document_fields.find_by(client_document: client_document)
  end
end
