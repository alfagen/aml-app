# frozen_string_literal: true

module Amlapp
  class DocumentGroupToStatusesController < Amlapp::ApplicationController
    def create
      AML::DocumentGroupToStatus.create!(permitted_params)
      redirect_to status_path(status)
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :new, locals: { client: e.record }
    end

    def destroy
      AML::DocumentGroupToStatus.find_by(permitted_params).destroy
      redirect_to status_path(status)
    end

    private

    def status
      @status ||= AML::Status.find permitted_params[:aml_status_id]
    end

    def permitted_params
      params.fetch(:aml_document_group_to_status, {}).permit(:aml_status_id, :aml_document_group_id)
    end
  end
end
