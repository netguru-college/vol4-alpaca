# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end
end
