# frozen_string_literal: true
# rubocop:disable all

Secrets = if Rails.application.config.require_master_key
            Rails.application.credentials
          else
            Secrets = Rails.application.secrets
          end
