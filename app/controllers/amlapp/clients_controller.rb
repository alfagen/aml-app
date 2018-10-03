# frozen_string_literal: true

module Amlapp
  class ClientsController < Amlapp::ApplicationController
    include Pagination

    authorize_actions_for Client

    def index
      render :index, locals: { clients: paginate(q.result.ordered) }
    end

    def show
      add_breadcrumb 'Клиенты', :clients_path
      add_breadcrumb "Клиент #{client.id}"
      render :show, locals: { client: client }
    end

    def reset
      authorize_action_for client
      client.reset_status!
      redirect_back_or_to client_path(client), notice: "Статус клиента сброшен до '#{client.aml_status.title}'"
    end

    def new
      add_breadcrumb 'Клиенты', :clients_path
      add_breadcrumb 'Добавляем нового клиента'
      render :new, locals: { client: AML::Client.new(permitted_params) }
    end

    def create
      client = AML::Client.build permitted_params
      authorize_action_for client
      client.save!

      flash.notice = "Создан клиент ##{client.id}"
      redirect_to client_path(client)
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :new, locals: { client: e.record }
    end

    private

    def q
      @q ||= AML::Client.ransack params.fetch(:q, {}).permit!
    end

    def client
      @client ||= AML::Client.find params[:id]
    end

    def permitted_params
      params.fetch(:client, {}).permit(:first_name, :surname, :patronymic, :birth_date, :aml_status_id)
    end
  end
end
