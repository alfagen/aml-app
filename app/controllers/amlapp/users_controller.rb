module Amlapp
  class UsersController < ApplicationController
    include Pagination

    authorize_actions_for :current_operator

    def index
      render :index, locals: { users: paginate(User.ordered) }
    end

    def new
      render :new, locals: { user: User.new(permitted_params) }
    end

    def create
      operator = AML::Operator.create!(name: permitted_params[:email])
      User.create! permitted_params.merge!(aml_operator: operator)
      redirect_to edit_operator_path(operator), notice: "Пользователь, #{permitted_params[:email]} был создан"
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :edit, locals: { user: e.record }
    end

    def edit
      render :edit, locals: { user: user }
    end

    def update
      user.update! permitted_params
      flash.now.notice = 'Профиль пользователя изменен.'
      render :index, locals: { users: paginate(User.ordered) }
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :edit, locals: { user: e.record }
    end

    private

    def user
      @user ||= User.find params[:id]
    end

    def permitted_params
      params.fetch(:user, {}).permit(:email, :password, :password_confirmation, :aml_operator_id, :role, :name)
    end
  end
end
