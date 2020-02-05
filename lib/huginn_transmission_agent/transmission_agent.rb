module Agents
  class TransmissionAgent < Agent

    default_schedule 'never'

    can_dry_run!

    description <<-MD
      Add a Agent description here
    MD

    include FormConfigurable

    form_configurable :username
    form_configurable :password
    form_configurable :url

    def default_options
      {
        username: "username",
        password: "password",
        url: "http://127.0.0.1:9091/transmission/rpc"
      }
    end

    def validate_options
      %i(username password url).all? { |key| options[:key].present? }
    end

    def working?
      !recent_error_logs?
    end

    def check
      begin
        client.all
      rescue => e
        error("Error connecting to transmission: #{e.class} - #{e.message}")
        raise e
      end
    end

    def receive(incoming_events)
      incoming_events.each do |event|
        log "Adding torrent: #{event.payload['description']}"
        client.create(event.payload['url'], event.payload['download-dir'], event.payload['bandwidthPriority'], event.payload['paused'])
      end
    end

    def client
      @client ||= TransmissionApi::Client.new(
        username: options[:username],
        password: options[:password],
        url: options[:url]
      )
    end
  end
end
