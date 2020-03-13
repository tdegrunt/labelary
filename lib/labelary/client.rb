# frozen_string_literal: true

module Labelary
  class Client
    def self.connection(*args)
      new(*args).connection
    end

    def connection
      @connection ||= Faraday.new(url: config.url) do |faraday|
        faraday.request :multipart
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
