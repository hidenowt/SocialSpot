class Evento
  include Mongoid::Document
  field :nome, :type => String
  field :tipo, :type => String
  field :local, :type => String
  field :custo, :type => Float
  field :data, :type => Time
  field :image, :type => String

  named_scope :futuro , where(:data.gte => Date.today)
  def next
    Evento.futuro.where(:_id.gt => self.id).limit(1).to_a.first || Evento.first 
  end
  def to_s
    ' - ' << self.nome
  end
  def self.next_by_id(id)
    Evento.futuro.where(:_id.gt => id).limit(1).to_a.first || Evento.first 
  end
  def quantos_vao?
    Track.where("parametros.id"=> self._id.to_s).only(:ip).and(:action => 'vou').aggregate.count
  end
end
