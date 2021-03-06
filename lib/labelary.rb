# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'

require 'faraday'
require 'faraday_middleware'

require 'labelary/label'
require 'labelary/image'

require 'labelary/client'
require 'labelary/configuration'
require 'labelary/version'

module Labelary
  def self.font
    Labelary.configuration.font
  end
end
