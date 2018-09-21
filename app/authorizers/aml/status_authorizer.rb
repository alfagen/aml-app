module AML
  class StatusAuthorizer < ApplicationAuthorizer
    def self.creatable_by?(operator)
      operator.administrator?
    end

    def self.processable_by?(operator)
      operator.administrator?
    end

    def self.readable_by?(operator)
      operator.administrator?
    end
  end
end
