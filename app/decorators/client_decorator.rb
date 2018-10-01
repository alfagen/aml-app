class ClientDecorator < ApplicationDecorator
  def id
    h.link_to object.id, h.client_path(object.id)
  end

  def current_order
    h.link_to "##{object.current_order.id}", h.order_path(object.current_order)
  end
end
