require "uri"
require_relative "bundler"
require_relative "dotenv"

task :default => :test

desc "Setup everything necessary to run and test the app"
task :setup => ["setup:create_dotenv_file", "database:setup"]
namespace :setup do
  task :create_dotenv_file do
    unless File.exists?(".env")
      FileUtils.cp(".env.example", ".env")
    end
  end
end

namespace :database do
  def database_name
    database_url = URI(ENV.fetch("DATABASE_URL"))
    database_url.path[1..-1]
  end

  def database_exists?
    `psql -l | grep #{database_name}`
    $?.success?
  end

  desc "Create the database, create the tables, and populate with seed data"
  task :setup => :create do
    require_relative "database/schema"
    Database::Schema.load(force: true)
    # Database::Seed.()
  end

  desc "Drop and resetup the database"
  task :reset => [:drop, :setup]

  desc "Create the database"
  task :create do
    unless database_exists?
      output = `createdb #{database_name}`
      puts output unless $?.success?
    end
  end

  desc "Drop the database"
  task :drop do
    if database_exists?
      output = `dropdb #{database_name}`
      puts output unless $?.success?
    end
  end
end

desc "Run the tests with cutest"
task :test => :setup do
  exec "bin/cutest test/*.rb"
end

desc "Boot the puma server"
task :server => :setup do
  exec "bin/puma -C config/puma.rb"
end

desc "Load IRB with all the code already loaded"
task :console => :setup do
  require_relative "app"
  require 'irb'
  ARGV.clear
  IRB.start
end
