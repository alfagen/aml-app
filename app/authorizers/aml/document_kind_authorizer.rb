module AML
  class DocumentKindAuthorizer < ApplicationAuthorizer
    def self.creatable_by?(operator)
      operator.administrator?
    end

    def self.readable_by?(operator)
      operator.administrator?
    end
  end
end
