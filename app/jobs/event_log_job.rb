class EventLogJob
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform args
    EventLogService.new.create_event_log(args)
  end
end