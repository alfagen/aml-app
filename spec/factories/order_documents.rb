FactoryBot.define do
  factory(:order_document, class: AML::OrderDocument) do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'test_files', 'test.png')) }
    workflow_state 'pending'
    order
    document_kind
  end
end
