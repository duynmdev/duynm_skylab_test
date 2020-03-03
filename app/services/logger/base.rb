class Logger::Base
  def initialize output_type: "console", data: ''
    @output_type = output_type
    @log_data = data
  end

  def process
    case @output_type.to_sym
    when :file
      ::Logger::LogFile.new(data: @log_data).process
    when :console
      ::Logger::LogConsole.new(data: @log_data).process
    when :mail
      ::Logger::LogMail.new(data: @log_data).process
    end
  end
end
