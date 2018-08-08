# frozen_string_literal: true

module ApplicationHelper
  def paginate(objects, options = {})
    options.reverse_merge!(theme: 'twitter-bootstrap-3')

    super(objects, options)
  end

  def app_title
    "AML #{AppVersion}"
  end

  def pending_documents
    ClientDocument.where(workflow_state: 'pending').count
  end
end
