module AML
  class DocumentKindFieldDefinitionAuthorizer < DocumentKindAuthorizer
    def updatable_by?(operator)
      return true if operator.administrator?

      (res_order.current_state >= :processing && res_order.operator_id == operator.id) && resource.definition.alive?
    end

    private

    def res_order(resource)
      resource.order_document.order
    end
  end
end
