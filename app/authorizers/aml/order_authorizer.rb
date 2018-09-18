module AML
  class OrderAuthorizer < ApplicationAuthorizer
    def self.creatable_by?(operator)
      operator.administrator? || operator.operator?
    end

    def self.processable_by?(operator)
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
