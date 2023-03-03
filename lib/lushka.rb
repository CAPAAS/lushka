# frozen_string_literal: true
require "async"
require "async/http/internet"

require_relative "lushka/version"
require_relative "lushka/pods"

module Lushka
  class Error < StandardError; end

  def self.root
    File.dirname __dir__
  end

  def self.logs
    File.join root, "logs"
  end
end
