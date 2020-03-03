class Logger::LogFile
  def initialize data:
    @data = data
  end

  def process
    out_file = File.open("#{Rails.root}/log/skylab_test_log.log", "a+")
    out_file.puts @data
    out_file.close
  end
end
