class Logger::LogConsole
  def initialize data:
    @data = data
  end

  def process
    p "========Opent Logger::LogConsole==========="
    p @data
    p "========End Logger::LogConsole==========="
  end
end
