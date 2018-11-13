module CustomActionMailer
  class DeliveryMethod < SendGridActionMailer::DeliveryMethod
    def to_personalizations(mail)
      Personalization.new.tap do |p|
        # personalization.add_to(SendGrid::Email.new(email: mail.email))
        to_emails(mail.to).each { |to| p.add_to(to) }
        # p.add_substitution(Substitution.new(key: "%asm_group_unsubscribe_raw_url%", value: "<%asm_group_unsubscribe_raw_url%>"))
        # p.add_substitution(Substitution.new(key: "%asm_global_unsubscribe_raw_url%", value: "<%asm_global_unsubscribe_raw_url%>"))
        # p.add_substitution(Substitution.new(key: "%asm_preferences_raw_url%", value: "<%asm_preferences_raw_url%>"))
        # personalization.add_dynamic_template_data(template_data)
      end
    end
  end
end
