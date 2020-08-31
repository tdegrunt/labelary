# frozen_string_literal: true

module Labelary
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :url, :http_adapter, :logger, :dpmm, :width, :height, :index, :content_type, :font

    def initialize
      @url          = 'http://api.labelary.com'
      @http_adapter = Faraday.default_adapter
      @logger       = Logger.new(File::NULL)
      @dpmm         = nil
      @width        = nil
      @height       = nil
      @index        = 0
      @content_type = 'image/png'
      @font         = ''
    end
  end
end
