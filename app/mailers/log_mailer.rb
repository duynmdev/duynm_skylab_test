class LogMailer < ApplicationMailer

  def send_log data
    @log_data = data
    mail to: "skylab_test@yopmail.com", subject: "Mail Logger"
  end
end
