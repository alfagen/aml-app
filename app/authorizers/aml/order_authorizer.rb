module AML
  class OrderAuthorizer < ApplicationAuthorizer
    # TODO: убедиться что принимает/отвергает заявку оператор-владелец или админ
    #
    def taken_by?(operator)
      return true if operator.administrator?

      resource.current_state >= :processing && resource.operator_id == operator.id
    end

    def readable_by?(operator)
      return true if operator.administrator?

      resource.operator == operator || resource.current_state < :processing
    end
  end
end
