class Admin::HomeController < ApplicationController
  layout "admin"
  before_filter :logged_or_redirect
  def index

  end
end
