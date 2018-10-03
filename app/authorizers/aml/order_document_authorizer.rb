module AML
  class OrderDocumentAuthorizer < ApplicationAuthorizer
    def acceptable_by?(operator)
      return true if operator.administrator?

      (resource.loaded? || resource.rejected?) && processed?(operator)
    end

    def rejectable_by?(operator)
      return true if operator.administrator?

      (resource.loaded? || resource.accepted?) && processed?(operator)
    end

    private

    def processed?(operator)
      resource.order.current_state >= :processing && resource.order.operator_id == operator.id
    end
  end
end
