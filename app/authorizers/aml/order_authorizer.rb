module AML
  class OrderAuthorizer < ApplicationAuthorizer

    # TODO убедиться что принимает/отвергает заявку оператор-владелец или админ
    #
    def self.creatable_by?(operator)
      true
    end

    def processable_by?(operator)
      operator.administrator? || operator.operator?
    end

    def taken_by?(operator)
      resource.current_state >= :processing && resource.operator_id == operator.id
    end

    def readable_by?(operator)
      operator.administrator? || resource.operator_id == operator.id || resource.current_state < :processing
    end
  end
end
