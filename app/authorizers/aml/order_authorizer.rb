module AML
  class OrderAuthorizer < ApplicationAuthorizer
    EVENTS = %i[done process accept reject cancel].freeze
    OWNER_REQUIRED_FOR_EVENTS = %i[accept reject cancel].freeze

    def self.readable_by?(_user)
      true
    end

    EVENTS.each do |event|
      ability = Authority.abilities[event] || raise("No ability for event #{event}")
      define_method "#{ability}_by?" do |_user|
        resource.enabled_workflow_events.include?(event) \
          && (operator.administrator? || OWNER_REQUIRED_FOR_EVENTS[event].present? && order.operator == operator)
      end
    end
  end
end
