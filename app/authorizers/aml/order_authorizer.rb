module AML
  class OrderAuthorizer < ApplicationAuthorizer
    def self.readable_by?(_user)
      true
    end

    def acceptable_by?(_user)
      resource.enabled_workflow_events.include? :accept
    end
  end
end
