# Стиль active для первоначального открытия на вкладке none
#
module OrderHelper
  def order_style(workflow_state)
    workflow_state == :none ? :inclusive : :exact
  end

  def client(client_document)
    client_document.order.client
  end
end
