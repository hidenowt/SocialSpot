class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :track

  def track
    trilha = Track.new
    session[:session_id] ||= trilha._id
    trilha.controller = params[:controller]
    trilha.action = params[:action]
    trilha.parametros = params
    trilha.ip = request.ip
    trilha.session_id = session[:session_id] || trilha._id
    trilha.created_at = Time.now
    trilha.save
  end
end
