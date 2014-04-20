require "bundler"
Bundler.setup :default, ENV.fetch("RACK_ENV") { "development" }
