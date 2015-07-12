class Api::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :init_response

  def init_response
    @resp = {success: false, errors: []}
  end

end
