# frozen_string_literal: true

module Amlapp
  class StatusesController < Amlapp::ApplicationController
    include Pagination

    def index
      render :index, locals: { statuses: paginate(AML::Status.ordered) }
    end

    def new
      render :new, locals: { status: AML::Status.new(permitted_params) }
    end

    def create
      AML::Status.create!(permitted_params)
      redirect_to statuses_path
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :new, locals: { status: e.record }
    end

    def show
      render :show, locals: { status: status, not_belong_groups: not_belong_groups }
    end

    private

    def status
      @status ||= AML::Status.find params[:id]
    end

    def not_belong_groups
      AML::DocumentGroup.where.not(id: status.aml_document_groups.pluck(:aml_document_group_id))
    end

    def permitted_params
      params.fetch(:status, {}).permit!
    end
  end
end
