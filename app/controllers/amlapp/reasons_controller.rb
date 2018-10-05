# frozen_string_literal: true

module Amlapp
  class ReasonsController < Amlapp::ApplicationController

    authorize_actions_for AML::RejectReason

    def index
      render :index, locals: { reasons: AML::RejectReason.all }
    end

    def new
      render :new, locals: { reason: AML::RejectReason.new(permitted_params) }
    end

    def create
      AML::RejectReason.create!(permitted_params)
      redirect_to reasons_path
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :new, locals: { reason: e.record }
    end

    def edit
      render :edit, locals: { reason: reason }
    end

    def update
      reason.update!(permitted_params)
      redirect_to reasons_path(reason)
    rescue ActiveRecord::RecordInvalid => error
      flash.now.alert = error.message
      render :edit, locals: error_params(error)
    end

    def destroy
      reason.destroy!
      redirect_to reasons_path
    end

    private

    def reason
      @reason ||= AML::RejectReason.find params[:id]
    end

    def permitted_params
      params.fetch(:reject_reason, {}).permit(:title)
    end
  end
end
