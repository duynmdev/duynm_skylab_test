module Api
  class EventLogsController < ApplicationController
    skip_before_action :verify_authenticity_token

    # POST /api/event_logs
    def create
      render json: EventLogService.new.create_event_log_job(event_log_params)
    end

    private
      def event_log_params
        params.permit(:event_name, :timestamp)
      end
  end
end