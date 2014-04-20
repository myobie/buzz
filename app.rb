require_relative "bundler"
require_relative "dotenv"
require "cuba"
require "cuba/render"
require "rack/protection"
require_relative "cuba/terminal_matcher"

Cuba.use Rack::Session::Cookie, secret: ENV.fetch("SESSION_SECRET")
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer
Cuba.use Rack::Protection::EscapedParams
Cuba.use Rack::Protection::FormToken

Cuba.plugin Cuba::Render
Cuba.plugin Cuba::TerminalMatcher

Cuba.define do
  on root do
    res.write view("home")
  end
end
