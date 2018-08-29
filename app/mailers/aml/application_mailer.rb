module AML
  class ApplicationMailer < ActionMailer::Base
    default from: 'from@example.com'
    layout 'aml/mailer'
  end
end
