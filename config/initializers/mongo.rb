File.open(File.join(::Rails.root.to_s, 'config/database.mongodb.yml'), 'r') do |f|
 @settings = YAML.load(f)[::Rails.env]
end

Mongoid.configure do |config|
 name = @settings["database"]
 host = @settings["host"]
 config.master = Mongo::Connection.new.db(name)
end

