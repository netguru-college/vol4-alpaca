# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def welcome; end

  def dashboard; end
end
