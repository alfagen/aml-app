# frozen_string_literal: true

require_relative 'application_controller'

module Amlapp
  class NotificationsController < ApplicationController
    authorize_actions_for AML::Notification
  end
end
