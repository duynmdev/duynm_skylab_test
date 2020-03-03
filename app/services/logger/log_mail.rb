class Logger::LogMail
  def initialize data:
    @data = data
  end

  def process
    LogMailer.send_log(@data).deliver
  end
end
