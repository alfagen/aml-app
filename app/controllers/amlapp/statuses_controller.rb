# frozen_string_literal: true
require_relative 'application_controller'

module Amlapp
  class StatusesController < ApplicationController
    include Pagination

    authorize_actions_for Status

    def index
      render :index, locals: { statuses: Status.alive.ordered }
    end

    def new
      render :new, locals: { status: Status.new(permitted_params) }
    end

    def edit
      render :edit, locals: { status: status }
    end

    def create
      Status.create!(permitted_params)

      redirect_to statuses_path, notice: 'Создан новый статус'
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :new, locals: { status: e.record }
    end

    def update
      status.update! permitted_params

      redirect_to statuses_path, notice: 'Статус обновлен'
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :edit, locals: { status: e.record }
    end

    def show
      render :show, locals: { status: status }
    end

    private

    def status
      @status ||= Status.find params[:id]
    end

    def permitted_params
      params.fetch(:status, {}).permit!
    end
  end
end
