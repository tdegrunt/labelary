# frozen_string_literal: true

module Labelary
  class Client
    def self.connection(*args)
      new(*args).connection
    end

    def connection
      @connection ||= Faraday.new(url: config.url) do |faraday|
        faraday.request :multipart
        faraday.request :retry, {
          max: 2,
          interval: 0.05,
          interval_randomness: 0.5,
          backoff_factor: 2,
          exceptions: [
            Errno::ETIMEDOUT,
            Faraday::ClientError,
            Faraday::NilStatusError,
            Faraday::ServerError,
            Faraday::TimeoutError,
            Timeout::Error
          ],
          methods: %i[get post]
        }
        faraday.response :raise_error
        faraday.response :logger, config.logger
        faraday.response :json, content_type: /\bjson$/

        faraday.adapter config.http_adapter
      end
    end

    private

    def config
      @config ||= Labelary.configuration
    end
  end
end
