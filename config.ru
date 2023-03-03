# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.
# use Rack::Deflater

require "bundler/setup"
require "lushka"

Console.logger.info "Lushka loaded!"

lushka = Rack::Builder.new do

  # use Rack::ShowExceptions
  use Rack::Logger

  map "/audit" do
    # use Rack::Lint
    run Lushka::Pods.freeze.new()
  end

  map "/ping" do
    use Rack::Lint
    run do |env|
      [200, {}, ["PONG!"]]
    end
  end

end

run lushka
