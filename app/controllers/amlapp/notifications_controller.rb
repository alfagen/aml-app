# frozen_string_literal: true

require_relative 'application_controller'

module Amlapp
  class NotificationsController < ApplicationController
    include Pagination

    rescue_from ActiveRecord::RecordInvalid, with: :handle_error

    authorize_actions_for AML::Notification

    def update
      notification.update! permitted_params

      respond_to do |format|
        format.html { redirect_to notifications_path, notice: 'Уведомление изменено' }
        format.json { respond_with_bip notification }
      end
    end

    private

    def handle_error(exception)
      respond_to do |format|
        format.html do
          flash.now.alert = exception.message
          render :edit, locals: { notification: exception.record }
        end
        format.json { respond_with_bip notification }
      end
      redirect_to notifications_path, notice: 'Уведомление изменено'
    end

    def notification
      @notification ||= AML::Notification.find params[:id]
    end

    def permitted_params
      params.fetch(:notification, {}).permit!
    end
  end
end
