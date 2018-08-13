# frozen_string_literal: true

class UsersController < ApplicationController
  include Pagination

  def index
    render :index, locals: { users: paginate(User.ordered) }
  end

  def new
    render :new, locals: { user: User.new(permitted_params) }
  end

  def create
    User.create!(permitted_params)
    UserMailer.with(user: User.last).welcome_email.deliver_later
    redirect_to users_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { user: e.record }
  end

  def edit
    render :edit, locals: { user: user }
  end

  def update
    user.update!(permitted_params)
    redirect_to users_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { user: e.record }
  end

  def block
    user.block!
    redirect_to users_path, notice: "Пользователь, #{user.email} был заблокирован"
  end

  def unblock
    user.unblock!
    redirect_to users_path, notice: "Пользователь, #{user.email} был разблокирован"
  end

  private

  def user
    @user ||= User.find params[:id]
  end

  def permitted_params
    params.require(:user).permit(:email, :password, :password_confirmation, :crypted_password, :salt, :workflow_state)
  end
end
