require_relative "bundler"
require_relative "dotenv"
require "dotenv/tasks"

task :test do
  exec "bin/cutest test/*.rb"
end

task :default => :test
