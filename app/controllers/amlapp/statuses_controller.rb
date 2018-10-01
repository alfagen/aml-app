# frozen_string_literal: true

module Amlapp
  class StatusesController < Amlapp::ApplicationController
    include Pagination

    def index
      render :index, locals: { statuses: AML::Status.alive.ordered }
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
      render :show, locals: { status: status }
    end

    private

    def status
      @status ||= AML::Status.find params[:id]
    end

    def permitted_params
      params.fetch(:status, {}).permit!
    end
  end
end
