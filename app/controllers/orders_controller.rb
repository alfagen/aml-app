class OrdersController < ApplicationController
  include Pagination

  def index
    render :index, locals: { orders: orders, workflow_state: workflow_state }
  end

  def new
    render :new, locals: { order: Order.new(permitted_params), client: client }
  end

  def create
    Order.create!(permitted_params)
    redirect_to orders_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { order: e.record, client_id: e.record.client.id }
  end

  def show
    render :show, locals: { order: order, client: client, documents: order.client_documents.ordered }
  end

  def in_process
    order.process!
    redirect_to order_path(order)
  end

  def accept
    order.accept!
    redirect_to order_path(order)
  end

  def reject
    order.reject!
    redirect_to order_path(order)
  end

  private

  DEFAULT_WORKFLOW_STATE = :pending

  def workflow_state
    params[:workflow_state] || DEFAULT_WORKFLOW_STATE
  end

  def orders
    paginate(Order.where(workflow_state: workflow_state))
  end

  def order
    @order ||= Order.find params[:id]
  end

  def client
    @client ||= Client.find(permitted_params[:client_id]) if params[:order]
  end

  def permitted_params
    params.fetch(:order).permit(:first_name, :surname, :patronymic, :birth_date, :client_id, :workflow_state) if params[:order]
  end
end
