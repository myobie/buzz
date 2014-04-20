Dir["database/*.rb"].each do |file|
  require_relative file
end

Database::Schema.load
