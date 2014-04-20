require_relative "bundler"
require_relative "dotenv"
require "dotenv/tasks"

task :default => :test

desc "Setup any config files or anything"
task :setup do
  unless File.exists?(".env")
    FileUtils.cp(".env.example", ".env")
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
