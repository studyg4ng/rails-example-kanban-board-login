class SessionsController < ApplicationController
  def create
    render text: "<pre>" + env["omniauth.auth"].to_yaml and return
  end
end
