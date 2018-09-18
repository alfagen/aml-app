module AML
  class DocumentGroupAuthorizer < ApplicationAuthorizer
    def self.creatable_by?(operator)
      operator.administrator?
    end

    def self.readable_by?(operator)
      operator.administrator?
    end
  end
end
