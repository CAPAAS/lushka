# frozen_string_literal: true
require "securerandom"


module Lushka

  # Sources for data extractions class
  class Pods

    def initialize; end

    def call(env)
      query = Rack::Request.new(env)
      if query.post?
        request = JSON.parse(query.body.read)
        response = log_request(request)
      else
        response = show_log
      end

      body = [response]
      status  = 200
      headers = { "content-type" => "application/json" }

      [status, headers, body]
    end

    def log_request(request)
      uuid = SecureRandom.uuid
      File.open("#{Lushka.logs}/pods.log", "a") do |log_file|
        log_file.puts "Request ##{uuid} — BODY: #{request.to_s}"
      end
      { request_uuid: uuid }.to_json
    end

    def show_log
      result = []
      File.readlines("#{Lushka.logs}/pods.log").each do |line|
        result.prepend(line)
      end
      result.join(" ")
    end
  end
end
