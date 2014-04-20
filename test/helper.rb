ENV["RACK_ENV"] = "test"
require_relative "../bundler"
require_relative "../dotenv"

require "cuba/test"
require_relative "../app"

# I like this way better
module Kernel
  private
  def describe(string, &blk)
    describes << string
    scope(&blk)
  end

  def describes
    cutest[:describes] ||= []
  end

  def describes_string
    describes.join(" ")
  end

  def should(string, &blk)
    test_name = "#{describes_string} should #{string}"
    test test_name, &blk
  end
end
