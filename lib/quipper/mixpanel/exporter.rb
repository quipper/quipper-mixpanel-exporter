require "httparty"

module Quipper
  module Mixpanel
    class Exporter
      include HTTParty

      base_uri "https://data.mixpanel.com"
      format :json

      def initialize
        @api_key = ENV["MIXPANEL_API_KEY"]
        @api_secret = ENV["MIXPANEL_API_SECRET"]
      end

      def export(event, args)
        params = args.clone
        params["api_key"] = @api_key
        params["format"] = 'json'
        params["expire"] = Time.now.to_i + 600
        params["sig"] = generate_signature(params)

        self.class.get("https://data.mixpanel.com" + event + "?" + encode(params))
      end

      def api(event, args)
        params = args.clone
        params["api_key"] = @api_key
        params["format"] = 'json'
        params["expire"] = Time.now.to_i + 600
        params["sig"] = generate_signature(params)
        params["page"] = args[:page] if args[:page]
        params["session_id"] = args[:session_id] if args[:session_id]

        self.class.get("https://mixpanel.com" + event + "?" + encode(params))
      end


      def encode(params)
        params.map{|key,val| "#{key}=#{CGI.escape(val.to_s)}"}.sort.join('&')
      end

      def generate_signature(args)
        Digest::MD5.hexdigest(args.map{|key,val| "#{key}=#{val}"}.sort.join + @api_secret)
      end
    end
  end
end
