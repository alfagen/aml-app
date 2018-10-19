# frozen_string_literal: true
# rubocop:disable all

Secrets = if Rails.application.config.require_master_key
            Rails.application.credentials
          else
            Rails.application.secrets
          end
