require_relative 'application_controller'

module Amlapp
  class OrderRejectionsController < ApplicationController
    authorize_actions_for :order, all_actions: :reject

    helper_method :order
    helper_method :available_reject_reasons

    def new
      render :new, locals: { order: order, reasons: available_reject_reasons('order_reason') }
    end

    def create
      authorize_action_for order
      order.reject! reject_reason: find_reject_reason, details: permitted_params[:reject_reason_details]
      flash.notice = 'Заявка отклонена'
      redirect_to order_path(order)
    rescue Workflow::TransitionHalted => e
      flash.now.alert = e.message
      render :new, locals: { order: order }
    end

    private

    def order
      @order ||= AML::Order.find params[:order_id]
    end

    def find_reject_reason
      id = permitted_params[:aml_reject_reason_id]
      AML::RejectReason.find_by(id: id) || raise("Не найдена причина отклонения #{id}")
    end

    def permitted_params
      params.require(:order).permit(:aml_reject_reason_id, :reject_reason_details)
    end
  end
end
