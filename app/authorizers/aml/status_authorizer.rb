module AML
  class StatusAuthorizer < ApplicationAuthorizer
    def self.creatable_by?(operator)
      operator.administrator?
    end

    def processable_by?(operator)
      operator.administrator?
    end

    def readable_by?(operator)
      operator.administrator?
    end
  end
end
