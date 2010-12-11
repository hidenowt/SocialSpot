class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :track

  def track
    trilha = Track.new
    trilha.controller = params[:controller]
    trilha.action = params[:action]
    trilha.parametros = params.inspect
    trilha.ip = request.ip
    trilha.created_at = Time.now
    trilha.save
  end
end
