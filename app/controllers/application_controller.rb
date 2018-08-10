# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  def not_authenticated
    render 'not_authenticated', layout: 'blank'
  end
end
