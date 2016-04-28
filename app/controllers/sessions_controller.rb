class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    session_service = SessionService.new
    session_service.create_session(params[:code], session)
    redirect_to '/'
  end
end