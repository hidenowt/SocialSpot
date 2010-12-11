class Track
  include Mongoid::Document
  field :controller, :type => String
  field :action, :type => String
  field :parametros , :type => Hash
  field :session_id, :type => String
  field :ip, :type => String
  field :created_at, :type => Time
end
