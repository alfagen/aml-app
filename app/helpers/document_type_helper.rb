# frozen_string_literal: true

# Стиль active для первоначального открытия на вкладке actived
#
module DocumentTypeHelper
  def document_active_type(workflow_state)
    workflow_state == :actived ? :inclusive : :exact
  end
end
