require "sequel"

module Database
  Connection = Sequel.connect(ENV.fetch("DATABASE_URL"))
  Connection.extension :pg_array, :pg_json
end
