module AML
  class ClientAuthorizer < ApplicationAuthorizer
    def self.updatable_by?(_operator)
      true
    end

    def updatable_by?(_operator)
      true
    end

    def resetable_by?(operator)
      updatable_by? operator
    end
  end
end
