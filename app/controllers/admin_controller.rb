class AdminController < ApplicationController

  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "pedro" && password == "123456"
    end
  end

end
