module AML
  class ClientAuthorizer < ApplicationAuthorizer
    def resetable_by?(operator)
      return false if resource.aml_status == AML.default_status || resource.aml_status.nil?

      updatable_by? operator
    end
  end
end
