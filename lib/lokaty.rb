require "lokaty/version"
require "geoip"

module Lokaty

  # Usage:
  # Lokaty::Guess.new(request.remote_ip).country_code
  class Guess
    def initialize(ip, args = {})
      @ip = ip
      @fallback = args[:fallback]
      @only = args[:only]
    end

    def country_code
      dir = File.expand_path('../lokaty', __FILE__)

      result = begin
        country_code = GeoIP.new("#{dir}/GeoIP.dat").country(@ip).country_code2.to_s
        country_code.to_s.downcase
      rescue SocketError
        # if you throw in a bogus hostname, we will return nil
      end

      if @only && !@only.include?(result)
        result = @fallback
      end

      if result == '--'
        result = @fallback
      end

      result
    end
  end
end
