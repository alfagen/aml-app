module AML
  class OrderAuthorizer < ApplicationAuthorizer
    def self.readable_by?(_user)
      true
    end
  end
end
