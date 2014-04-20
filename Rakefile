require_relative "bundler"
require_relative "dotenv"
require "dotenv/tasks"

task :default => :test

desc "Run the tests with cutest"
task :test do
  exec "bin/cutest test/*.rb"
end

desc "Boot the puma server"
task :server do
  exec "bin/puma"
end

desc "Load IRB with all the code already loaded"
task :console do
  require_relative "app"
  require 'irb'
  ARGV.clear
  IRB.start
end
