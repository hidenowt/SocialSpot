class EventosController < ApplicationController
  def index
    @evento = Evento.futuro.limit(1).to_a.first || Evento.last
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
    @evento = Evento.find(params[:id])
    respond_to do |format|
      format.js { 
        render(:update){|page| page.replace_html 'qts', :partial => "vou", :locals => { :evento => @evento } }
      }
    end

  end

  def show
    @evento = Evento.find(params[:id])
    render :action => :index
  end

end
