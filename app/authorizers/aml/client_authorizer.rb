module AML
  class ClientAuthorizer < ApplicationAuthorizer
    def resetable_by?(operator)
      updatable_by? operator
    end
  end
end
