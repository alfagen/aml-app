# frozen_string_literal: true

require_relative 'application_controller'

module Amlapp
  class OperatorsController < ApplicationController
    include Pagination

    authorize_actions_for AML::Operator

    def index
      render :index, locals: { operators: paginate(AML::Operator.ordered) }
    end

    def edit
      render :edit, locals: { operator: operator }
    end

    def update
      operator.update!(permitted_params)
      flash.now.notice = "Оператор, #{operator.name} был изменен"
      render :edit, locals: { operator: operator }
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :edit, locals: { operator: e.record }
    end

    def block
      operator.block!
      redirect_to operators_path, notice: "Оператор, #{operator.name} был заблокирован"
    end

    def unblock
      operator.unblock!
      redirect_to operators_path, notice: "Оператор, #{operator.name} был разблокирован"
    end

    private

    def operator
      @operator ||= AML::Operator.find params[:id]
    end

    def permitted_params
      params.fetch(:operator, {}).permit(:name, :role)
    end
  end
end
