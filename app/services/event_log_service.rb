class EventLogService

  def validate_before_create event_log_params
    return {
      status: false,
      message: "Miss params event name!"
    } unless event_log_params[:event_name].present?

    return {
      status: false,
      message: "Miss params timestamp!"
    } unless event_log_params[:timestamp].present?

    { status: true }
  end

  def create_event_log_job event_log_params
    result = validate_before_create(event_log_params)
    return result unless result[:status]

    EventLogJob.perform_async(event_log_params)

    { status: true, message: "Pushed into the queue!"}
  end

  def create_event_log event_log_params
    EventLog.create(event_log_params)
  end
end