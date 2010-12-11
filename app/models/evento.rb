class Evento
  include Mongoid::Document
  field :tipo, :type => String
  field :local, :type => String
  field :custo, :type => Float
  field :data, :type => Time

  def next 
    Evento.where(:_id.gt => self.id).limit(1).to_a.first || Evento.first 
  end
  def self.next_by_id(id)
    Evento.where(:_id.gt => id).limit(1).to_a.first || Evento.first 
  end
end
