class EventosController < ApplicationController
  def index
    @evento = Evento.where(:data.gte => Date.today).limit(1).to_a.first
  end

  def next
    evento = Evento.find(params[:id])
    @evento = evento.next
    render :action => :index
  end

  def new
    @evento = Evento.new
  end

  def create
    @evento = Evento.new(params[:evento])
    @evento.save
  end

  def vou
  end

  def show
    @evento = Evento.find(params[:id])
    render :action => :index
  end

end
