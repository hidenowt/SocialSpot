class Evento
  include Mongoid::Document
  field :tipo, :type => String
  field :local, :type => String
  field :custo, :type => Float
  field :data, :type => Time
end
