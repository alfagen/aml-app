# frozen_string_literal: true

module ApplicationHelper
  def app_title
    "AML #{AppVersion}"
  end

  def current_time_zone
    Time.zone
  end
end
