require "cuba"

module Cuba::TerminalMatcher
  def terminal(path)
    /#{path}\/?\z/
  end
end
