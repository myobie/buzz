require "forwardable"
require "singleton"
require_relative "connection"

module Database
  class Schema
    def load(force: false)
      create_table :incidents, force: force do
        primary_key :id
        String      :summary
      end

      create_table :messages, force: force do
        primary_key :id
        String      :subject
        json        :from
        json        :body
        foreign_key :incident_id, :incidents
      end

      create_table :rules, force: force do
        primary_key :id
        String      :name
        column      :statements, "json[]"
      end
    end

    # other junk down here

    include Singleton

    class << self
      extend Forwardable
      delegate [:load] => :instance
    end

    def create_table(table_name, force:, &blk)
      Database::Connection.drop_table?(table_name, cascade: true) if force
      method_name = force ? :create_table! : :create_table?
      Database::Connection.send method_name, table_name, &blk
    end
  end
end
