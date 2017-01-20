class Admin::BaseController < ApplicationController
  before_filter :admin_required

  protected
  def admin_required
    # implementation
  end
end
