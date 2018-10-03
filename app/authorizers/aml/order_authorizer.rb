module AML
  class OrderAuthorizer < ApplicationAuthorizer
    def readable_by?(operator)
      return true if operator.administrator?

      resource.operator == operator || resource.current_state < :processing
    end

    def donable_by?(operator)
      resource.all_documents_loaded?
    end

    def processable_by?(operator)
      resource.pending?
    end

    def acceptable_by?(operator)
      processed?(operator) && resource.all_documents_accepted?
    end

    def rejectable_by?(operator)
      processed?(operator)
    end

    def cancelable_by?(operator)
      resource.current_state == :processing && resource.operator_id == operator.id
    end

    private

    def processed?(operator)
      resource.current_state >= :processing && resource.operator_id == operator.id
    end
  end
end
